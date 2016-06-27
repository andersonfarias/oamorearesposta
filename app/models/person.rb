class Person < ActiveRecord::Base
	has_one :address
	has_many :phones

	accepts_nested_attributes_for :phones
	accepts_nested_attributes_for :address

	validates_presence_of :first_name
	validates_numericality_of :age, only_integer: true
	validates_format_of :email, :with => Devise::email_regexp, unless: "email.nil? or email.blank?"

	enum gender: [
		:male,
		:female,
		:transgender
	]
end
