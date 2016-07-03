class BeneficiariesController < ApplicationController

	before_action :set_beneficiary, only: [:show, :edit]

	def edit
	end

	def show
	end

	def index
		department_name = params[:department_name].to_s
		beneficiary_first_name = params[:beneficiary_first_name].to_s
		beneficiary_last_name = params[:beneficiary_last_name].to_s
		@beneficiaries = Beneficiary.joins(:department, :person)
			.where("people.first_name LIKE '%#{beneficiary_first_name}%'
				AND people.last_name LIKE '%#{beneficiary_last_name}%' 
				AND departments.name LIKE '%#{department_name}%'" )
			.all.paginate( :page => params[ :page ] )
	end

	private

	def set_beneficiary
		@beneficiary = Beneficiary.find(params[:id])
	end
end
