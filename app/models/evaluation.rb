class Evaluation < ActiveRecord::Base
  belongs_to :beneficiary, inverse_of: :evaluation
  belongs_to :problems_during_process, inverse_of: :evaluation
  belongs_to :independent_variable, inverse_of: :evaluation

  accepts_nested_attributes_for :beneficiary
  accepts_nested_attributes_for :problems_during_process
  accepts_nested_attributes_for :independent_variable

  enum ops: [:'0', :'1', :'2', :'3', :'4', :'5', :x]
end
