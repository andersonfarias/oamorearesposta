class Person < ActiveRecord::Base
  has_one :contact
  has_one :address

  enum gender: [
    :male,
    :female,
    :transgender
  ]
end
