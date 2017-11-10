class ClinicTreatmentsController < ApplicationController
    before_action :set_clinic_treatment, only: [:edit, :update, :destroy]

    def new
        @page_size = 10
        @page = params[:page].nil? ? 1 : params[:page]
        @limit = @page_size * @page
        @beneficiary_id = params[:beneficiary_id]
        
        @clinic_treatment = ClinicTreatment.new(
            date: Date.today.strftime(t('date.formats.default')),
            beneficiary: Beneficiary.find(@beneficiary_id)
        )

        @clinic_treatments = ClinicTreatment.by_beneficiary(params[:beneficiary_id])
        @attendances = Attendance.by_beneficiary(params[:beneficiary_id])

        @items = []
        @clinic_treatments.each do |ct|
            @items << { id: ct.id, date: ct.date, type: 'ct', axis: ct.axis, description: ct.description, name: ct.user.person.full_name }
        end
        @attendances.each do |a|
            @items << { id: a.activity_diary.id, date: a.activity_diary.diary.date, type: 'a', axis: a.activity_diary.diary.axis, description: a.activity_diary.diary.description, name: a.activity_diary.diary.user.person.full_name, activity: a.activity_diary.activity.name }
        end

        @items = @items.sort! do |x, y|
            if x[:date] == y[:date]
                (x[:id] <=> y[:id]) * -1
            else
                (x[:date] <=> y[:date]) * -1
            end
        end

        @items = @items.paginate(page: @page, per_page: @page_size)
    end

    def edit
        @current_page = params[:current_page]
        @clinic_treatment.date = @clinic_treatment.date.strftime('%d/%m/%Y')
    end

    def create
        @clinic_treatment = ClinicTreatment.new(diary_params)
        if @clinic_treatment.save
            redirect_to new_clinic_treatment_path(beneficiary_id: diary_params[:beneficiary_id]),
                        notice: t('controllers.actions.create.success', model: ClinicTreatment.model_name.human(count: 1))
        else
            @clinic_treatments = ClinicTreatment.by_beneficiary(diary_params[:beneficiary_id])
                                                .paginate(page: params[:page])
            render 'new', notice: @clinic_treatment.errors
        end
    end

    def update
        if @clinic_treatment.update(diary_params)
            redirect_to new_clinic_treatment_path(beneficiary_id: diary_params[:beneficiary_id], page: params[:clinic_treatment][:current_page]),
                        notice: t('controllers.actions.update.success', model: ClinicTreatment.model_name.human(count: 1))
        else
            @clinic_treatments = ClinicTreatment.by_beneficiary(diary_params[:beneficiary_id])
                                                .paginate(page: params[:page])
            render 'new', notice: @clinic_treatment.errors
        end
    end

    def destroy
        beneficiary_id = @clinic_treatment.beneficiary_id
        if @clinic_treatment.destroy
            redirect_to new_clinic_treatment_path(beneficiary_id: beneficiary_id, page: params[:current_page]),
                notice: t('controllers.actions.destroy.success', model: ClinicTreatment.model_name.human(count: 1))
        end
    end

    private

    def set_clinic_treatment
        @clinic_treatment = ClinicTreatment.find(params[:id])
    end

    def diary_params
        params.require(:clinic_treatment).permit(:date, :description, :user_id, :beneficiary_id, axis: [])
    end
end
