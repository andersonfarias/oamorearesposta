class Partner < ActiveRecord::Base
    extend Enumerize

    belongs_to :person, dependent: :destroy
    belongs_to :contact_person_1, class_name: 'Person', dependent: :destroy
    belongs_to :contact_person_2, class_name: 'Person', dependent: :destroy

    validates_presence_of :partner_type, :work_areas
    validates_associated :person

    accepts_nested_attributes_for :person
    accepts_nested_attributes_for :contact_person_1
    accepts_nested_attributes_for :contact_person_2

    enum partner_type: [
        :supplier, :financier, :donor, :network_resource, :piaui_receipt, :volunteering
    ]

    serialize :work_areas, Array
    enumerize :work_areas, in: [
        :health, :education, :culture_and_leisure,
        :professional_training, :therapy_in_general, :social_assistance,
        :entrepreneurship, :environment, :community_mobilization
    ], multiple: true

    def to_s
        name()
    end

    def name
      person.first_name
    end

    def self.by_name_and_status(params)
        args = { name: "%#{params[:person_name]}%", active: TRUE }
        args[:active] = params[:is_active].to_bool if params.key?(:is_active)
        Partner.joins(:person).where(['LOWER(people.first_name) LIKE LOWER( :name ) AND is_active = :active', args]).order('people.first_name')
    end

end
