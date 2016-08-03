class PpclsController < ApplicationController
	def new
		@ppcl = Ppcl.new(beneficiary: Beneficiary.find(params[:beneficiary_id]))
		@ppcls = Ppcl.by_beneficiary(params[:beneficiary_id]).paginate(page: params[:page], per_page: 10)
	end

	def create
		@ppcl = Ppcl.new(ppcl_params)
		if @ppcl.save
			redirect_to new_ppcl_path(beneficiary_id: ppcl_params[:beneficiary_id]),
				notice: t('controllers.actions.create.success', model: Ppcl.model_name.human(count: 1))
		else
			@ppcls = Ppcl.by_beneficiary(ppcl_params[:beneficiary_id])
				.paginate(page: params[:page])
			render 'new', notice: @ppcl.errors
		end
	end

	def show
		@ppcl = Ppcl.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	private
	def ppcl_params
		params.require(:ppcl).permit(:name, :dc_reference, :age, :gender, :relationship, 
			:social_role, :partner_device, :treatment_device, :institutional_device, :user_id, :beneficiary_id)
	end
end