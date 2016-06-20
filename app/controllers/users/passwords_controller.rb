class Users::PasswordsController < Devise::PasswordsController
	layout "external", only: [ :new, :create, :edit, :update ]

	# GET /resource/password/new
	#def new
	#	super
	#end

	# POST /resource/password
	def create
		user = User.where( email: params[ :user ][ :email ] ).first
		if not user.nil?
			if not user.is_active
				redirect_to new_password_path( user ), :notice => t( "controllers.users.actions.update.inactive_user" )
				return
			end
		end
		super
	end

	# GET /resource/password/edit?reset_password_token=abcdef
	#def edit
	#	super
	#end

	# PUT /resource/password
	#def update
	#	super
	#end

	# protected

	# def after_resetting_password_path_for(resource)
	#   super(resource)
	# end

	# The path used after sending reset password instructions
	# def after_sending_reset_password_instructions_path_for(resource_name)
	#   super(resource_name)
	# end
end
