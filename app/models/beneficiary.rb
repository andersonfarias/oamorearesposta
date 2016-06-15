class Beneficiary < ActiveRecord::Base
  belongs_to :department
  belongs_to :person
end
