require 'csv'

class ImportPartnersService

	WORK_AREA = [:not_informed, :education,  :environment,  :not_informed, :professional_training,
		:social_assistance, :not_informed, :culture_and_leisure, :not_informed, :entrepreneurship, 
		:not_informed, :not_informed, :not_informed, :community_mobilization, :not_informed,
		:health, :not_informed, :therapy_in_general]
      
	def call
		list_partners_areas = []
		CSV.foreach("#{Rails.root}/app/services/migration_files/partners_work_area.csv") do |r|
		 	row = r.first
			partner_area = row.split(";")
			list_partners_areas << {partner_id: partner_area[0], area: partner_area[1]}
		end
		work_areas_by_partner = list_partners_areas.inject(Hash.new([])) do |h, a| 
				h[a[:partner_id].to_i] += [WORK_AREA[a[:area].to_i]] 
				h 
			end

		CSV.foreach("#{Rails.root}/app/services/migration_files/partners.csv") do |r|
		 	row = r.first
			partner = row.split("|")
			partner_id = 	partner[0]
			fantasy_name = 	partner[3]
			cnpj = 			partner[5]
			cep = 			partner[6]
			street = 		partner[7]
			number = 		partner[8]
			complement = 	partner[9]
			neighborhood = 	partner[10]
			file_phones =	[partner[14], partner[15]]
			email = 		partner[16].gsub("'","")
			type = 			partner[18]

			phones = []
			file_phones.compact.reject(&:blank?).each do |p|
				phones << Phone.new(number: p)
			end

			address = Address.new(street: street, cep: cep, number: number, 
				complement: complement, neighborhood: neighborhood, city_id: 3582)
			person = Person.new(address: address, first_name: fantasy_name, email: email, phones: phones)
			Partner.new( person: person,
				fantasy_name: fantasy_name, cnpj: cnpj, partner_type: type.to_i-1,
				work_areas: work_areas_by_partner[partner_id.to_i]).save
			

		end
	end
end



