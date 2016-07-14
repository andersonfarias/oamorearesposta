require 'csv'

class ImportBeneficiaryService
	def call
		puts 'CREATING BENEFICIARIES'
		FirstContactFile.destroy_all

		aux = 0
		CSV.foreach("#{Rails.root}/app/services/migration_files/beneficiaries.csv") do |r|
		 	row = r.first
			beneficiary = row.split("|")
			aux += 1

			family_structure = if beneficiary[21] == "Outros" then 5 else beneficiary[21] end

			answer = []
			if beneficiary[61] && !beneficiary[61].empty?
				beneficiary[61].split(";").each {|v| answer << FirstContactFile.answer.values.at(v.to_i-1)}
			else
				answer << FirstContactFile.answer.values.at(7)
			end

			petitions = []
			if beneficiary[63] && !beneficiary[63].empty?
				beneficiary[63].split(";").each {|v| petitions << FirstContactFile.petitions.values.at(v.to_i-1)}
			else
				petitions << FirstContactFile.petitions.values.at(24)
			end

			results = []
			if beneficiary[62] && !beneficiary[62].empty?
				beneficiary[62].split(";").each {|v| results << FirstContactFile.results.values.at(v.to_i-1)}
			else
				results << FirstContactFile.results.values.at(4)
			end

			first_contact_conditions = []
			if beneficiary[87] && !beneficiary[87].empty?
				beneficiary[87].split(";").each {|v| first_contact_conditions << FirstContactFile.first_contact_conditions.values.at(v.to_i-1)}
			else
				first_contact_conditions << FirstContactFile.first_contact_conditions.values.at(30)
			end

			education_levels = []
			education_levels += FirstContactFile.education_levels.values[0..beneficiary[50].to_i] if beneficiary[50].to_i < 8
			education_levels << FirstContactFile.education_levels.values.at(9) if beneficiary[82] == "'SIM'"
			education_levels << FirstContactFile.education_levels.values.at(9) if beneficiary[83] == "'SIM'"
			if beneficiary[85] && !beneficiary[85].empty? && education_levels.empty?
				beneficiary[85].split(";").each {|m| education_levels << FirstContactFile.education_levels.values.at(m.delete("'").to_i)}
			else
				education_levels << FirstContactFile.education_levels.values.at(0)
			end

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
					department_id: beneficiary[1].to_i,
					person: Person.new(
						first_name: beneficiary[7].split(" ", 2)[0].delete("'"),
						last_name: if beneficiary[7].split(" ", 2)[1] then beneficiary[7].split(" ", 2)[1].delete("'") else "" end,
						birthdate: beneficiary[10],
						age: beneficiary[11],
						gender: beneficiary[14].to_i-1,
						email: if beneficiary[81] == "''" then "nao_informado@ong.com.br" else beneficiary[81] end,
						address: Address.new(
							street: beneficiary[76],
							neighborhood: beneficiary[78],
							number: beneficiary[77],
							cep: beneficiary[75],
							complement: beneficiary[79],
							city_id: if beneficiary[99] == "''" || beneficiary[99].to_i == 0 then 3582 else beneficiary[99].to_i end
						),
						phones: [
							Phone.new()
						]
					)
				),
				contact_source: Person.new(
					first_name: "Não Informado",
					age: 0,
					gender: 0,
					phones: [
						Phone.new()
					]
				),
				support: Person.new(
					first_name: "Não Informado",
					phones: [
						Phone.new()
					]
				)
			)
			p "Linha: #{aux} - Errro: #{f.errors.messages}" if !f.errors.empty?
			p "===========================================" if !f.errors.empty?
		end
		puts 'BENEFICIARIES CREATED'
	end
end
