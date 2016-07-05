class BeneficiariesController < ApplicationController

	before_action :set_beneficiary, only: [:show, :edit]

	def edit
	end

	def show
	end

	def index
		root = Beneficiary.joins( :person, :department )
		root = root.where( "LOWER( people.first_name ) LIKE LOWER('%#{params[ :beneficiary_first_name ].to_s}%')" ) unless params[ :beneficiary_first_name ].blank?
		root = root.where( "LOWER( people.last_name ) LIKE LOWER('%#{params[ :beneficiary_last_name ].to_s}%')" ) unless params[ :beneficiary_last_name ].blank?
		root = root.where( "LOWER( departments.name ) LIKE LOWER('%#{params[ :department_name ].to_s}%')" ) unless params[ :department_name ].blank?

		@beneficiaries = root.paginate( :page => params[ :page ] )
	end

	private

	def set_beneficiary
		@beneficiary = Beneficiary.find(params[:id])
	end

end