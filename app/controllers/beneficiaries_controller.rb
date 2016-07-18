class BeneficiariesController < ApplicationController
    before_action :set_beneficiary, only: [:show, :edit]

    def edit
    end

    def show
    end

    def index
        @beneficiaries = Beneficiary.by_code_name_and_department(params).paginate(page: params[:page]).order(:id)
    end

    def destroy
        @beneficiary = Beneficiary.find(params[:id])
        @beneficiary.is_active = false
        @beneficiary.save
        p @beneficiary.errors.full_messages
        p @beneficiary.person.errors.full_messages
        redirect_to beneficiaries_path, notice: t('controllers.actions.destroy.success', model: Beneficiary.model_name.human(count: 1))
    end

    private

    def set_beneficiary
        @beneficiary = Beneficiary.find(params[:id])
    end
end
