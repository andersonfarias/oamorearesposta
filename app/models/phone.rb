class Phone < ActiveRecord::Base
  belongs_to :person, inverse_of: :phones

  validates_presence_of :person
  validates_associated :person
end
