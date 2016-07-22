class Diary < ActiveRecord::Base
	extend Enumerize

	belongs_to :user
	belongs_to :beneficiary

	validates_presence_of :axis

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
