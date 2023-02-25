class Ppcl < ApplicationRecord
	belongs_to :beneficiary, optional: true
	belongs_to :user, optional: true

	scope :by_beneficiary, ->(id) { where(beneficiary_id: id).order(name: :asc)  }

	validates_presence_of :name, :dc_reference, :age, :gender, :relationship, 
			:social_role, :partner_device, :treatment_device, :institutional_device, :beneficiary, :user

	enum gender: [
		:male,
		:female,
		:transgender
	]

	enum partner_device: [
		:rs, :rp, :rlo_partner
	]

	enum treatment_device: [
		:team, :rsc, :ro, :rrc, :rlo_treatment
	]

	enum institutional_device: [
		:public_institutional, :private_institutional
	]

end
