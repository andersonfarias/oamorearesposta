class ClinicTreatmentsController < ApplicationController

  def new
    @clinic_treatment = ClinicTreatment.new(
      date: Date.today.strftime(t "date.formats.default"),
      beneficiary: Beneficiary.find(params[:beneficiary_id])
    )
    @clinic_treatments = ClinicTreatment.by_beneficiary(params[:beneficiary_id])
      .paginate(page: params[:page])
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

  private
  def diary_params
    params.require(:clinic_treatment).permit(:date, :description, :user_id, :beneficiary_id, :axis => [])
  end

end
