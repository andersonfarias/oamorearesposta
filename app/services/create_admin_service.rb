class CreateAdminService
	def call
		user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
			puts 'CREATING ADMIN USER'
			user.person = Person.create( first_name: Rails.application.secrets.admin_name, email: Rails.application.secrets.admin_email )
			user.password = Rails.application.secrets.admin_password
			user.password_confirmation = Rails.application.secrets.admin_password
			if user.confirm! && user.admin!
				puts 'CREATED ADMIN USER: ' << user.email
			end
		end
	end
end
