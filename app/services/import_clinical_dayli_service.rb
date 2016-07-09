require 'csv'

class ImportClinicalDayliService
	USERS = {"Rita Lisboa" => 1,
			 "Ricardo Oliveira Silva" => 2, 
			 "Mantovani Lopes de Oliveira" => 3,
			 "Fellipe Carlos Soares" => 4,
			 "kleyton rodrigues" => 5,
			 "Francisca das Chagas Ferreira" => 6,
			 "Thais Andrade Guimes" => 7,
			 "juliagaleno" => 8,
			 "Denise Assun?" => 9,
			 "Thais Andrade" => 10,
			 "Leylane" => 11}

	def call
		aux = 0
		list = []
		CSV.foreach("#{Rails.root}/app/services/migration_files/clinical_daylis.csv") do |r|
		 	row = r.first
			diary = row.split("|")
			id = diary[0]
			beneficiary = diary[1]
			date = diary[2]
			comment = diary[3]
			user = USERS[diary[4]]
			created_at = diary[5]
		end
		
	end
	
end