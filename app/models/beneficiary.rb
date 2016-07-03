class Beneficiary < ActiveRecord::Base
  belongs_to :department
  belongs_to :person, dependent: :destroy
  has_one :first_contact_file, inverse_of: :beneficiary, dependent: :destroy

  accepts_nested_attributes_for :person

  validates_associated :person, :department
  validates_presence_of :person, :department, :first_contact_file

  def self.by_name_and_department params
    Beneficiary.joins(:department, :person)
			.where("people.first_name LIKE '%#{params[:beneficiary_first_name].to_s}%'
				AND people.last_name LIKE '%#{params[:beneficiary_last_name].to_s}%'
				AND departments.name LIKE '%#{params[:department_name].to_s}%'" )
  end
end
