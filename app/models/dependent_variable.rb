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
  belongs_to :main_network
  belongs_to :basic_assistance

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
