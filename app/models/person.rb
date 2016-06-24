class Person < ActiveRecord::Base
	has_one :address
	has_many :phones

	validates_presence_of :first_name, :last_name, :email
	validates :age, presence: true, if: "birthdate.nil?"
	validates :birthdate, presence: true, if: "age.nil?"
	validates :age, numericality: { only_integer: true }
	validates_format_of :email,:with => Devise::email_regexp

	accepts_nested_attributes_for :phones
	accepts_nested_attributes_for :address

	enum gender: [
		:male,
		:female,
		:transgender
	]
end
