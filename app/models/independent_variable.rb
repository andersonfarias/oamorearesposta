class IndependentVariable < ActiveRecord::Base
  belongs_to :assistance_activity
  belongs_to :community_treatment
  belongs_to :albergue
  belongs_to :diagnosis_and_case_evaluation
  belongs_to :education
  belongs_to :guidelines_reference
  belongs_to :health
  belongs_to :involved_structure
  belongs_to :social_participation
  belongs_to :used_technique
  belongs_to :work
end
