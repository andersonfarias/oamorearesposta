class DependentVariable < ActiveRecord::Base
  belongs_to :dependent_education
  belongs_to :drug
  belongs_to :job
  belongs_to :sexual_life
  belongs_to :self_security
  belongs_to :dependent_health
  belongs_to :group_life
  belongs_to :family
  belongs_to :alcohol
  belongs_to :legality
  belongs_to :home
  belongs_to :hygiene
  belongs_to :feeding
  belongs_to :psychological_situation
end
