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

    def report
        @beneficiaries = Beneficiary.report_search(params)
        unless @beneficiaries.empty?
            @data = []
            @detalhado = []

            case params["group_option"]
            when "people.gender"
                @beneficiaries.group_by(&:gender).each do |b|
                    @data << {y: b[1].count, legendText: t("enum.person.gender.#{Person.genders.keys[b[0]]}"), key: b[0]}
                    @detalhado << {beneficiaries: b[1], key: b[0]}
                end
            when "first_contact_files.date"
                @beneficiaries.group_by(&:date).each do |b|
                    @data << {y: b[1].count, legendText: b[0].strftime('%d/%m/%Y'), key: b[0]}
                    @detalhado << {beneficiaries: b[1], key: b[0]}
                end
            when "first_contact_files.education_levels"
                @data << {y: b[1], legendText: b[0]}        
            end

            gon.detalhado = @detalhado
            gon.data = @data
        end
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
