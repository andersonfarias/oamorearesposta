class BeneficiariesController < ApplicationController
    respond_to :html, :xml, :json

    before_action :set_beneficiary, only: [:show, :edit]

    def autocomplete_beneficiary_name
        render json: to_autocomplete_items(Beneficiary.by_name_and_status(person_name: params[:q]))
    end

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
        redirect_to beneficiaries_path, notice: t('controllers.actions.destroy.success', model: Beneficiary.model_name.human(count: 1))
    end

    private

    def set_beneficiary
        @beneficiary = Beneficiary.find(params[:id])
    end

    def to_autocomplete_items items
        items.collect do |item|
            [item.id.to_s, item.to_s]
        end
    end
end
