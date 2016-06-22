class Beneficiary < ActiveRecord::Base
  belongs_to :department
  belongs_to :person

  accepts_nested_attributes_for :person
end
