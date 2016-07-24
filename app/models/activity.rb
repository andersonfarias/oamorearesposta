class Activity < ActiveRecord::Base
    extend Enumerize

    belongs_to :department

    validates_presence_of :name, :axis, :department
    validates_associated :department

    def self.by_name_and_status(params)
        args = { name: "%#{params[:activity_name]}%", active: TRUE }
        args[:active] = params[:is_active].to_bool if params.key?(:is_active)
        Activity.where(['LOWER(name) LIKE LOWER( :name ) AND is_active = :active', args]).order('name')
    end

end
