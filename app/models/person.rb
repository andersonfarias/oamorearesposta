class Person < ActiveRecord::Base
	has_one :address
	has_many :phones

	validates_presence_of :first_name

	accepts_nested_attributes_for :phones
	accepts_nested_attributes_for :address

	enum gender: [
		:male,
		:female,
		:transgender
	]
end
