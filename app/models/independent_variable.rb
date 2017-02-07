class IndependentVariable < ActiveRecord::Base
  belongs_to :albergue
  belongs_to :assistance_activity
  belongs_to :community_treatment
  belongs_to :diagnosis_and_case_evaluation
  belongs_to :education
  belongs_to :guidelines_reference
  belongs_to :health
  belongs_to :involved_structure
  belongs_to :social_participation
  belongs_to :used_technique
  belongs_to :work

  accepts_nested_attributes_for :albergue
  accepts_nested_attributes_for :assistance_activity
  accepts_nested_attributes_for :community_treatment
  accepts_nested_attributes_for :diagnosis_and_case_evaluation
  accepts_nested_attributes_for :education
  accepts_nested_attributes_for :guidelines_reference
  accepts_nested_attributes_for :health
  accepts_nested_attributes_for :involved_structure
  accepts_nested_attributes_for :social_participation
  accepts_nested_attributes_for :used_technique
  accepts_nested_attributes_for :work
end
