class Beneficiary < ActiveRecord::Base
	belongs_to :department
	belongs_to :person, dependent: :destroy
	has_one :first_contact_file, inverse_of: :beneficiary, dependent: :destroy

	accepts_nested_attributes_for :person

	validates_associated :person, :department
	validates_presence_of :person, :department, :first_contact_file

	def self.by_code_name_and_department params
		code_condition = ""
		if not params[ "beneficiary_id" ].blank?
			code_condition = "beneficiaries.id = #{params[ "beneficiary_id" ]} AND "
		end

		Beneficiary.joins(:department, :person).where( "#{code_condition}LOWER(people.first_name) LIKE LOWER('%#{params[:beneficiary_first_name].to_s}%')
				AND LOWER(people.last_name) LIKE LOWER('%#{params[:beneficiary_last_name].to_s}%')
				AND LOWER(departments.name) LIKE LOWER('%#{params[:department_name].to_s}%')" )
	end
end
