class FirstContactFile < ActiveRecord::Base
	extend Enumerize

	belongs_to :beneficiary, inverse_of: :first_contact_file
	belongs_to :user, inverse_of: :first_contact_files
	belongs_to :contact_source, :class_name => "Person", dependent: :destroy
	belongs_to :support, :class_name => "Person", dependent: :destroy

	accepts_nested_attributes_for :beneficiary
	accepts_nested_attributes_for :contact_source
	accepts_nested_attributes_for :support

	validates_associated :beneficiary, :user
	validates :number_daughters, :number_of_previous_treatments,
		:number_sons, numericality: { only_integer: true }
	validates_presence_of :hour, :operational_context_first_contact,
		:how_established_first_contact, :how_person_knew_about_the_organization,
		:beneficiary_and_contact_source_relationship, :place_of_previous_treatments,
		:marital_status, :ethnic_group, :family_structure, :job, :education_levels,
		:first_contact_conditions, :petitions, :answer, :results, :contact_source,
		:support, :beneficiary, :religion, :number_daughters, :number_sons,
		:is_new_partner, :contact_source_type, :institution, :date,
		:number_of_previous_treatments

	enum hour: [
		:'0801_1100', :'1101_1400', :'1401_1700',
		:'1701_2000', :'2001_2300', :'2301_0200',
		:'0201_0500', :'0501_0759'
	]

	enum operational_context_first_contact: [
		:residential_center, :not_residential_center,
		:street_Unit, :listening_center, :prevention_unit,
		:mobile_unity, :operating_network, :other_context
	]

	enum how_established_first_contact: [
		:by_phone, :the_organization_structure,
		:in_the_street, :in_the_person_home,
		:in_other_institutions, :other_way
	]

	enum contact_source_type: [
		:individual_person,
		:organization_group_institution,
		:other_type
	]

	enum how_person_knew_about_the_organization: [
		:itself, :through_a_friend, :by_a_member_of_his_family,
		:by_means_of_a_known, :through_another_institution,
		:by_own_institution, :by_own_partner, :other_option
	]

	enum beneficiary_and_contact_source_relationship: [
		:same_person, :friend, :member_of_their_family_of_origin,
		:member_of_his_own_family, :institution_organization_group,
		:other_relationship
	]

	enum place_of_previous_treatments: [
		:on_here, :in_another_place
	]
	enum marital_status: [
		:not_married, :married, :separately,
		:widower, :divorced,
		:polygamy, :union_libre,
		:other_marital_status
	]

	enum ethnic_group: [
		:white,
		:black,
		:brown
	]

	enum family_structure: [
		:lives_are, :live_with_children, :nuclear_family,
		:family_without_formal_marriage, :mate_without_matrimonio,
		:other_family_structure
	]

	enum job: [
		:formal_work, :informal_work, :auto_entrepreneur,
		:student, :never_was_employed, :other_job
	]

	serialize :education_levels, Array
	enumerize :education_levels, in: [
		:fundamental_I, :fundamental_II, :high_School,
		:technician, :university,
		:post_graduate, :can_write, :know_read,
		:know_add, :know_subtract,
		:know_multiply, :know__divisions,
		:know_average, :know_percentages,
		:using_Computer, :other_scolarity
	], multiple: true

	serialize :first_contact_conditions, Array
	enumerize :first_contact_conditions, in: [
		:alcoholic_substances, :antisocial_behavior, :psychiatric,
		:behavioural, :relational, :family_violence,
		:violation_of_adults, :sex_work, :cool, :pregnancy_birth,
		:health_problems, :extreme_poverty, :Street_life,
		:economic_support, :school, :severe_exclusion,
		:intra_community_violence, :gnterinstitucionais_networks,
		:psychological_crisis, :training_and_development,
		:organization_and_planning, :hiv_aids, :ets,
		:trafficking_trafficking_in_persons,
		:jobless, :tuberculosis, :family_problems,
		:posttraumatic_stress_disorder, :sexual_problems,
		:rape_of_children, :other_facilities,
		:intravenous_drug_use, :hepatitis, :change_of_residence,
		:migration_immigration, :stigma_of_sexual_identity, :illiteracy
	], multiple: true

	serialize :petitions, Array
	enumerize :petitions, in: [
		:petition_economic_support, :care_delivery, :routing,
		:conversation, :board_guidance,
		:legal_computer_services, :loan_guarantees,
		:training_training, :creche, :medical_hospitalization,
		:information, :Community_integration, :hospitalization,
		:petition_organization_and_planning, :forced_hospitalization,
		:educational_recuperation, :social_service, :therapy,
		:family_visit, :healthcare_exams, :feeding,
		:clean_clothes_hygiene_services, :occupation_work,
		:medicines, :bureaucratic, :other_petition
	], multiple: true

	serialize :answer, Array
	enumerize :answer, in: [
		:mark_meeting, :gives_an_information, :answer_board_guidance,
		:routing_answer, :listening_immediate_crisis_management,
		:indicatios_and_suggestions, :accompaniment, :medical_care,
		:hygiene_clean_clothes, :welcome_day_or_night, :other_answer
	], multiple: true

	serialize :results, Array
	enumerize :results, in: [
		:came_to_meet, :followed_contact, :interrupted_contact,
		:start_a_program, :activities_inclusion, :other_result
	], multiple: true
end
