class Department < ActiveRecord::Base
	has_many :beneficiaries

	validates_presence_of :name
end