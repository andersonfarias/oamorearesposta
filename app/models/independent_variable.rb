class IndependentVariable < ApplicationRecord
  belongs_to :albergue, optional: true
  belongs_to :assistance_activity, optional: true
  belongs_to :community_treatment, optional: true
  belongs_to :diagnosis_and_case_evaluation, optional: true
  belongs_to :education, optional: true
  belongs_to :guidelines_reference, optional: true
  belongs_to :health, optional: true
  belongs_to :involved_structure, optional: true
  belongs_to :social_participation, optional: true
  belongs_to :used_technique, optional: true
  belongs_to :work, optional: true
  belongs_to :axis1, optional: true
  belongs_to :axis2, optional: true
  belongs_to :axis3, optional: true
  belongs_to :axis4, optional: true
  belongs_to :axis5, optional: true

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
  accepts_nested_attributes_for :axis1
  accepts_nested_attributes_for :axis2
  accepts_nested_attributes_for :axis3
  accepts_nested_attributes_for :axis4
  accepts_nested_attributes_for :axis5
end
