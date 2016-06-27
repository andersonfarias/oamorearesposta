class Address < ActiveRecord::Base
  belongs_to :city, inverse_of: :addresses
  belongs_to :person, inverse_of: :address

  validates_associated :person, :city
  validates_presence_of :person, :city
end
