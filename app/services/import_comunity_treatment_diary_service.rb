require 'csv'

class ImportComunityTreatmentDiaryService
	USERS = {"Rita Lisboa" => "ritaf.lisboa@gmail.com",
			 "Mantovani Lopes de Oliveira" => "thormlo51@gmail.com",
			 "Thais Andrade" => "thais.hepa.ufrgs@gmail.com"}

	def call
		puts 'CREATING CLINIC TREATMENT'
		aux = 0
		list = []

		USERS.each do |key, value|
			USERS[key] = User.find_by(email: value).id
		end

		CSV.foreach("#{Rails.root}/app/services/migration_files/clinical_daylis.csv") do |r|
		 	row = r.first
			diary = row.split("|")
			id = diary[0]
			beneficiary = diary[1]
			date = diary[2]
			comment = diary[3]
			user_id = USERS[diary[4]] || USERS["Rita Lisboa"]
			created_at = diary[5]
			ClinicTreatment.create(beneficiary_id: beneficiary, date: date, description: comment, user_id: user_id)
		end
		puts 'CLINIC TREATMENT CREATED'
	end

end
