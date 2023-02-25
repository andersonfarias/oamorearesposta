class Address < ApplicationRecord
  belongs_to :city, inverse_of: :addresses, optional: true
  belongs_to :person, inverse_of: :address, optional: true

  validates_associated :person, :city
  validates_presence_of :person, :city
end
