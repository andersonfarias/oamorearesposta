class Phone < ApplicationRecord
  belongs_to :person, inverse_of: :phones, optional: true

  validates_presence_of :person
  validates_associated :person
end
