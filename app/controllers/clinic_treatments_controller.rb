class ClinicTreatmentsController < ApplicationController
  before_action :set_clinic_treatment, only: [:edit, :update]

  def new
    @clinic_treatment = ClinicTreatment.new(
      date: Date.today.strftime(t "date.formats.default"),
      beneficiary: Beneficiary.find(params[:beneficiary_id])
    )
    @clinic_treatments = ClinicTreatment.by_beneficiary(params[:beneficiary_id])
      .paginate(page: params[:page])
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
      @clinic_treatments = ClinicTreatment.by_beneficiary(params[:beneficiary_id])
        .paginate(page: params[:page])
      render 'new', notice: @clinic_treatment.errors
    end
  end

  def update
    if @clinic_treatment.update(diary_params)
        redirect_to new_clinic_treatment_path(beneficiary_id: diary_params[:beneficiary_id], page: params[:clinic_treatment][:current_page]),
        notice: t('controllers.actions.update.success', model: ClinicTreatment.model_name.human(count: 1))
    else
      @clinic_treatments = ClinicTreatment.by_beneficiary(params[:beneficiary_id])
        .paginate(page: params[:page])
      render 'new', notice: @clinic_treatment.errors
    end
  end

  private
  def set_clinic_treatment
    @clinic_treatment = ClinicTreatment.find(params[:id])
  end

  def diary_params
    params.require(:clinic_treatment).permit(:date, :description, :user_id, :beneficiary_id, :axis => [])
  end

end
