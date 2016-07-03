class Citizen < ActiveRecord::Base
  belongs_to :person
  belongs_to :comunity
end
