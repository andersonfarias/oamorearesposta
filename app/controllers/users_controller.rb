class UsersController < ApplicationController
	respond_to :html, :xml, :json

	before_action :set_minimum_password_length, only: [ :new ]
	after_action :verify_authorized

	def index
		@users = User.where( is_active: true ).paginate( :page => params[ :page ] )
		authorize User
	end

	def show
		@user = User.find( params[ :id ] )
		if not @user.is_active
			@user = nil
		end
		authorize @user
	end

	def update
		@user = User.find( params[ :id ] )
		if not @user.is_active
			redirect_to users_path, :notice => t( "controllers.users.actions.update.inactive_user" )
			return
		end
		authorize @user
		if @user.update_attributes(secure_params)
			redirect_to users_path, :notice => t( "controllers.users.actions.update.successful_msg" )
		else
			redirect_to users_path, :alert => t("controllers.users.actions.update.error_msg" )
		end
	end

	def destroy
		user = User.find( params[ :id ] )
		authorize user
		user.is_active = false
		user.save()
		redirect_to users_path, :notice => t( "controllers.users.actions.destroy.successful_msg" )
	end

	def new
		@user = User.new
		authorize current_user
	end

	def create
		authorize current_user

		@user = User.new_with_session(sign_up_params || {}, session)
		@user.save
		yield user if block_given?
		if @user.persisted?
			if @user.active_for_authentication?
				set_flash_message! :notice, :signed_up
				sign_up('user', @user)
				respond_with user, location: after_sign_up_path_for(@user)
			else
				set_flash_message! :notice, :"signed_up_but_#{@user.inactive_message}"
				expire_data_after_sign_in!
				respond_with @user, location: after_inactive_sign_up_path_for(@user)
			end
		else
			clean_up_passwords @user
			set_minimum_password_length
			respond_with @user
		end
	end

	private

	def secure_params
		params.require(:user).permit(:role)
	end

	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def set_minimum_password_length
		@minimum_password_length = User.password_length.min
	end

	def clean_up_passwords(object)
		object.clean_up_passwords if object.respond_to?(:clean_up_passwords)
	end

	def set_flash_message(key, kind, options = {})
		message = find_message(kind, options)
		if options[:now]
			flash.now[key] = message if message.present?
		else
			flash[key] = message if message.present?
		end
	end

	def set_flash_message!(key, kind, options = {})
		if is_flashing_format?
			set_flash_message(key, kind, options)
		end
	end

	def find_message(kind, options = {})
		options[:scope] ||= translation_scope
		options[:default] = Array(options[:default]).unshift(kind.to_sym)
		options[:resource_name] = 'user'
		options = devise_i18n_options(options)
		I18n.t("#{options[:resource_name]}.#{kind}", options)
	end

	def translation_scope
		"devise.#{controller_name}"
	end

	def devise_i18n_options(options)
		options
	end

	def after_inactive_sign_up_path_for(resource)
		scope = Devise::Mapping.find_scope!(resource)
		router_name = Devise.mappings[scope].router_name
		context = router_name ? send(router_name) : self
		context.respond_to?(:root_path) ? context.root_path : "/"
	end

	def after_sign_up_path_for(resource)
		after_sign_in_path_for(resource)
	end

end
