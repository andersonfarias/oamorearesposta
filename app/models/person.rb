class Person < ActiveRecord::Base
    has_one :address, inverse_of: :person, dependent: :destroy
    has_many :phones, inverse_of: :person, dependent: :destroy

    accepts_nested_attributes_for :phones
    accepts_nested_attributes_for :address

    validates_presence_of :first_name
    validates_numericality_of :age, only_integer: true, greater_than: -1, less_than: 99
    validates_format_of :email, with: Devise.email_regexp, unless: 'email.nil? or email.blank?'
    validates :birthdate, past_date: true

    enum gender: [
        :male,
        :female,
        :transgender
    ]

    def full_name
        "#{first_name} #{last_name}"
    end

    def initials
        "#{first_name} #{last_name}".scan(/(\A\w|(?<=\s)\w)/).flatten.join
    end
end
