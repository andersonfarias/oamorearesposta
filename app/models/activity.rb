class Activity < ApplicationRecord
    extend Enumerize

    belongs_to :department, optional: true

    validates_presence_of :name, :axis, :department
    validates_associated :department

    def self.by_name_and_status(params)
        args = { name: "%#{params[:activity_name]}%", active: true }
        args[:active] = params[:is_active].to_bool if params.key?(:is_active)
        Activity.where(['LOWER(name) LIKE LOWER( :name ) AND is_active = :active', args]).order('name')
    end

end
