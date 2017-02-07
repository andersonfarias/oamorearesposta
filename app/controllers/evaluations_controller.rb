class EvaluationsController < ApplicationController
	before_filter :set_evaluation

	def index
	end

	def new
		@evaluation = Evaluation.new(
			evaluation_date: Date.today,
			organization_code: "AMRBR",
			beneficiary: Beneficiary.find(params[:beneficiary_id]),
			problems_during_process: ProblemsDuringProcess.new,
			independent_variable: IndependentVariable.new(
				albergue: Albergue.new,
				assistance_activity: AssistanceActivity.new,
				health: Health.new,
				community_treatment: CommunityTreatment.new,
				diagnosis_and_case_evaluation: DiagnosisAndCaseEvaluation.new,
				education: Education.new,
				guidelines_reference: GuidelinesReference.new,
				involved_structure: InvolvedStructure.new,
				social_participation: SocialParticipation.new,
				used_technique: UsedTechnique.new,
				work: Work.new))
	end

	def create
		@evaluation = Evaluation.new(evaluation_params)
		if @evaluation.save
			redirect_to @evaluation,
				notice: t('controllers.actions.create.success', model: Evaluation.model_name.human(count: 1))
		else
			render 'new', notice: @evaluation.errors
		end
	end

	def show
	end

	def edit
	end

	private
	def set_evaluation
		@evaluation = Evaluation.find(params[:id]) if params[:id]
	end

	def evaluation_params
        params.require(:evaluation).permit(
        	:problems_during_process_attributes => [
        		:sustancias_alcool ])
    end
end