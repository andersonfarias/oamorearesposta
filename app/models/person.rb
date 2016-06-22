class Person < ActiveRecord::Base
	has_one :address
	has_many :phones

	enum gender: [
		:male,
		:female,
		:transgender
	]
end
