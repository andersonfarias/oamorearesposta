class Diary < ApplicationRecord
    extend Enumerize

    belongs_to :user, optional: true
    belongs_to :beneficiary, optional: true

    validates_presence_of :axis, :user
    validates_associated	:user

    validates :date, past_date: true

    serialize :axis, Array
    enumerize :axis, in: [
        :prevention_and_organization,
        :basic_assistance,
        :education,
        :medical_therapies_and_psychological,
        :work
    ], multiple: true
end
