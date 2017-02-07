class ProblemsDuringProcess < ActiveRecord::Base
	has_one :evaluation, inverse_of: :beneficiary, dependent: :destroy
end
