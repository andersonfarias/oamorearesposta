class Citizen < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :comunity, optional: true
end
