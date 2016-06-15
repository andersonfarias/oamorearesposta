class Person < ActiveRecord::Base
  has_one :contact
  has_one :address
  has_one :beneficiary

  enum gender: [
    :male,
    :female,
    :transgender
  ]
end
