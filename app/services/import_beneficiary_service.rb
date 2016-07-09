require 'csv'

class ImportBeneficiaryService
	def call
		FirstContactFile.destroy_all
		list = []
		CSV.foreach("#{Rails.root}/app/services/migration_files/beneficiaries.csv") do |r|
		 	row = r.first
			beneficiary = row.split(/\|/)
			
			family_structure = if beneficiary[21] == "Outros" then 5 else beneficiary[21] end
			answer = []
			beneficiary[61].split(";").each {|v| answer << FirstContactFile.answer.values.at(v.to_i-1)}
			petitions = []
			beneficiary[63].split(";").each {|v| petitions << FirstContactFile.petitions.values.at(v.to_i-1)}
			results = []
			beneficiary[62].split(";").each {|v| results << FirstContactFile.results.values.at(v.to_i-1)}
			first_contact_conditions = []
			beneficiary[87].split(";").each {|v| first_contact_conditions << FirstContactFile.first_contact_conditions.values.at(v.to_i-1)}
			education_levels = []
			education_levels += FirstContactFile.education_levels.values[0..beneficiary[50].to_i] if beneficiary[50].to_i < 8
			education_levels << FirstContactFile.education_levels.values.at(9) if beneficiary[82] == "'SIM'"
			education_levels << FirstContactFile.education_levels.values.at(9) if beneficiary[83] == "'SIM'"
			beneficiary[85].split(";").each {|m| education_levels << FirstContactFile.education_levels.values.at(m.delete("'").to_i)}
			
			f = FirstContactFile.create(
				id: beneficiary[0].to_i,
				date: beneficiary[4],
				hour: 1,
				institution: "Não Informado.",
				operational_context_first_contact: 7,
				how_established_first_contact: beneficiary[13].to_i-1,
				contact_source_type: 2,
				how_person_knew_about_the_organization: 7,
				beneficiary_and_contact_source_relationship: 5,
				is_new_partner: true,
				number_of_previous_treatments: 0,
				place_of_previous_treatments: 0,
				marital_status: beneficiary[18].to_i-1,
				number_sons: beneficiary[23].to_i-1,
				number_daughters: beneficiary[24].to_i-1,
				ethnic_group: if beneficiary[55].to_i-1 < 0 then 0 else beneficiary[55].to_i-1 end,
				religion: "Não Informado.",
				family_structure: family_structure.to_i,
				job: 5,
				comments: beneficiary[90],
				user_id: 1,
				education_levels: education_levels,
				answer: answer,
				petitions: petitions,
				results: results,
				first_contact_conditions: first_contact_conditions,
				beneficiary: Beneficiary.new(
					id: beneficiary[0].to_i,
					department_id: beneficiary[2].to_i,
					person: Person.new(
						id: beneficiary[0].to_i,
						first_name: beneficiary[7].split(" ", 2)[1],
						last_name: beneficiary[7].split(" ", 2)[1],
						birthdate: beneficiary[10],
						age: beneficiary[11],
						gender: beneficiary[14].to_i-1,
						email: if beneficiary[81].empty? then nil else beneficiary[81] end,
						address: Address.new(
							id: beneficiary[0].to_i,
							street: beneficiary[76],
							neighborhood: beneficiary[78],
							number: beneficiary[77],
							cep: beneficiary[75],
							complement: beneficiary[79],
							city_id: beneficiary[100].to_i
						)
					)
				), 
				contact_source: Person.new(
					id: beneficiary[0].to_i,
					first_name: "Não Informado",
					age: 0,
					gender: 0
				),
				support: Person.new(
					id: beneficiary[0].to_i,
					first_name: "Não Informado"
				)
			)
			list << f
			# p f.errors.messages
			p beneficiary[2].to_i
		end
		
		p list.first.errors.messages
	end
end
