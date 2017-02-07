class DependentVariable < ActiveRecord::Base
  belongs_to :evaluation
  has_one :dependent_education
  has_one :drug
  has_one :job
  has_one :sexua_llife
  has_one :self_security
  has_one :dependent_health
  has_one :group_life
  has_one :family
  has_one :alcohol
  has_one :legality
  has_one :home
  has_one :hygiene
  has_one :feeding
  has_one :psychological_situation
end
