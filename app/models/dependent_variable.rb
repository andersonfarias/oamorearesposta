class DependentVariable < ActiveRecord::Base
  belongs_to :dependent_education, inverse_of: :dependent_variable
  belongs_to :drug, inverse_of: :dependent_variable
  belongs_to :job, inverse_of: :dependent_variable
  belongs_to :sexual_life, inverse_of: :dependent_variable
  belongs_to :self_security, inverse_of: :dependent_variable
  belongs_to :dependent_health, inverse_of: :dependent_variable
  belongs_to :group_life, inverse_of: :dependent_variable
  belongs_to :family, inverse_of: :dependent_variable
  belongs_to :alcohol, inverse_of: :dependent_variable
  belongs_to :legality, inverse_of: :dependent_variable
  belongs_to :home, inverse_of: :dependent_variable
  belongs_to :hygiene, inverse_of: :dependent_variable
  belongs_to :feeding, inverse_of: :dependent_variable
  belongs_to :psychological_situation, inverse_of: :dependent_variable

  accepts_nested_attributes_for :dependent_education
  accepts_nested_attributes_for :drug
  accepts_nested_attributes_for :job
  accepts_nested_attributes_for :sexual_life
  accepts_nested_attributes_for :self_security
  accepts_nested_attributes_for :dependent_health
  accepts_nested_attributes_for :group_life
  accepts_nested_attributes_for :family
  accepts_nested_attributes_for :alcohol
  accepts_nested_attributes_for :legality
  accepts_nested_attributes_for :home
  accepts_nested_attributes_for :hygiene
  accepts_nested_attributes_for :feeding
  accepts_nested_attributes_for :psychological_situation
end
