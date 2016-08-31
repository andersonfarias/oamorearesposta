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
        @data = []
        beneficiaries = Beneficiary.report_search(params) if params["commit"]
        unless beneficiaries.nil?
            case params["group_option"]
            when "people.gender"
                group_by_education_lavel = Hash.new{|hash, key| hash[key] = Array.new;}
                beneficiaries.each do |b|
                    FirstContactFile.education_levels.values.each do |el|
                        if b.education_levels.include? el.to_s
                            group_by_education_lavel[el] << b 
                        end
                    end
                end

                beneficiaries.group_by(&:gender).each do |b|
                    @data << {y: b[1].count, legendText: t("enum.person.gender.#{Person.genders.keys[b[0]]}"), beneficiaries: b[1]}
                end
            when "first_contact_files.date"
                beneficiaries.group_by(&:date).each do |b|
                    @data << {y: b[1].count, legendText: b[0].strftime('%d/%m/%Y'), beneficiaries: b[1]}
                end
            when "first_contact_files.education_levels"
                group_by_education_lavel = Hash.new{|hash, key| hash[key] = Array.new;}
                beneficiaries.each do |b|
                    FirstContactFile.education_levels.values.each do |el|
                        group_by_education_lavel[el] << b  if b.education_levels.include? el.to_s
                    end
                end
                group_by_education_lavel.each do |b|
                    @data << {y: b[1].count, legendText: t("enumerize.first_contact_file.education_levels.#{b[0]}"), beneficiaries: b[1]}
                end
            end
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
