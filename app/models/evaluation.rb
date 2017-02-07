class Evaluation < ActiveRecord::Base
  belongs_to :beneficiary, inverse_of: :evaluation
  belongs_to :problems_during_process, inverse_of: :evaluation

  accepts_nested_attributes_for :beneficiary
  accepts_nested_attributes_for :problems_during_process

  enum ops: [:'0', :'1', :'2', :'3', :'4', :'5', :x]
end
