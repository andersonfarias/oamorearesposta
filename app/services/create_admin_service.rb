class CreateAdminService
	def call
		puts 'CREATING ADMIN USER'
		person = Person.create( first_name: Rails.application.secrets.admin_name, email: Rails.application.secrets.admin_email )
		partner = Partner.create(person: person, partner_type: :volunteering, work_areas: [:education], contact_person_1: person)
		user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
			user.person = person
			user.partner = partner
			user.password = Rails.application.secrets.admin_password
			user.password_confirmation = Rails.application.secrets.admin_password
			if user.confirm && user.admin!
				puts 'CREATED ADMIN USER: ' << user.email
			end
		end
	end
end
