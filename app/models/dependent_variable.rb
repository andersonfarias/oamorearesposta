class DependentVariable < ApplicationRecord
  belongs_to :dependent_education, optional: true
  belongs_to :drug, optional: true
  belongs_to :job, optional: true
  belongs_to :sexual_life, optional: true
  belongs_to :self_security, optional: true
  belongs_to :dependent_health, optional: true
  belongs_to :group_life, optional: true
  belongs_to :family, optional: true
  belongs_to :alcohol, optional: true
  belongs_to :legality, optional: true
  belongs_to :home, optional: true
  belongs_to :hygiene, optional: true
  belongs_to :feeding, optional: true
  belongs_to :psychological_situation, optional: true
  belongs_to :main_network, optional: true
  belongs_to :basic_assistance, optional: true

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
  accepts_nested_attributes_for :main_network
  accepts_nested_attributes_for :basic_assistance
end
