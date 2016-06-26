class Beneficiary < ActiveRecord::Base
  belongs_to :department
  belongs_to :person, dependent: :destroy
  has_one :first_contact_file, dependent: :destroy

  accepts_nested_attributes_for :person

  validates_associated :person, :department, :first_contact_file
  validates_presence_of :person, :department
end
