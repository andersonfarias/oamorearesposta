class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :beneficiary
  belongs_to :problems_during_process
  belongs_to :dependent_variable
  belongs_to :independent_variable

  accepts_nested_attributes_for :beneficiary
  accepts_nested_attributes_for :problems_during_process
  accepts_nested_attributes_for :dependent_variable
  accepts_nested_attributes_for :independent_variable

  enum ops: [:'0', :'1', :'2', :'3', :'4', :'5', :x]
end
