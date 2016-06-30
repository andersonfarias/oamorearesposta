class BeneficiariesController < ApplicationController

	before_action :set_beneficiary, only: [:show, :edit]

	def edit
	end

	def show
	end

	def index
		@beneficiaries = Beneficiary.all.paginate( :page => params[ :page ] )
	end

	private
	
	def set_beneficiary
		@beneficiary = Beneficiary.find(params[:id])
	end
end