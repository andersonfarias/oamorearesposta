class Attendance < ApplicationRecord
    belongs_to :activity_diary, optional: true
    belongs_to :beneficiary, optional: true

    validates_presence_of :activity_diary, :beneficiary
    validates_associated :activity_diary, :beneficiary

    scope :by_beneficiary, ->(id) { where(beneficiary_id: id).includes(activity_diary: [ { diary: [ { user: :person} ] }, :activity ] ).references(:activity_diary) }
end
