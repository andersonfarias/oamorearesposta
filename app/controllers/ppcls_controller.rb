class PpclsController < ApplicationController

	before_action :set_ppcl, only: [:show, :edit, :update]

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
		respond_to do |format|
			format.js
		end
	end

	def edit
	end

	def update
		if @ppcl.update(ppcl_params)
            redirect_to new_ppcl_path(beneficiary_id: ppcl_params[:beneficiary_id], page: params[:ppcl][:current_page]),
                        notice: t('controllers.actions.update.success', model: Ppcl.model_name.human(count: 1))
        else
            @ppcl = Ppcl.by_beneficiary(ppcl_params[:beneficiary_id])
                                                .paginate(page: params[:page])
            render 'new', notice: @ppcl.errors
        end
	end

	def destroy
		@ppcl = Ppcl.find(params[:id])
		beneficiary_id = @ppcl.beneficiary_id
        if @ppcl.destroy
            redirect_to new_ppcl_path(beneficiary_id: beneficiary_id),
				notice: t('controllers.actions.destroy.success', model: Ppcl.model_name.human(count: 1))
        end
	end

	private
	def set_ppcl
		@ppcl = Ppcl.find(params[:id])
	end

	def ppcl_params
		params.require(:ppcl).permit(:name, :dc_reference, :age, :gender, :relationship, 
			:social_role, :partner_device, :treatment_device, :institutional_device, :user_id, :beneficiary_id)
	end
end