class ClinicTreatment < Diary
  validates_presence_of :date, :description
  validates_associated :beneficiary, :user

  scope :by_beneficiary, ->(id) { where(beneficiary_id: id).order(date: :desc, id: :desc)  }
end
