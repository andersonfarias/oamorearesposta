class Ppcl < ActiveRecord::Base
	belongs_to :beneficiary
	belongs_to :user

	scope :by_beneficiary, ->(id) { where(beneficiary_id: id).order(id: :desc)  }

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
