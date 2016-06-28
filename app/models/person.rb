class Person < ActiveRecord::Base
	has_one :address, inverse_of: :person, dependent: :destroy
	has_many :phones, inverse_of: :person, dependent: :destroy

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

	def full_name
		"#{first_name} #{last_name}"
	end
end
