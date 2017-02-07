class IndependentVariable < ActiveRecord::Base
  belongs_to :evaluation
  has_one :assistance_activities
  has_one :albergue
  has_one :health
  has_one :education
  has_one :work
  has_one :social_participation
  has_one :guidelines_references
  has_one :community_treatment
  has_one :diagnosis_and_caseevaluation
  has_one :involved_structures
  has_one :used_techniques
end
