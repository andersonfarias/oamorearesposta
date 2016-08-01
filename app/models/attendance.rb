class Attendance < ActiveRecord::Base
    belongs_to :activity_diary
    belongs_to :beneficiary

    validates_presence_of :activity_diary, :beneficiary
    validates_associated :activity_diary, :beneficiary

    scope :by_beneficiary, ->(id) { where(beneficiary_id: id)  }
end
