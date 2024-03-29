class Department < ApplicationRecord
    has_many :beneficiaries

    validates_presence_of :name

    def self.by_name_and_status(params)
      if params[:is_active].nil? or params[:is_active].empty?
        Department.where(["LOWER(name) LIKE LOWER( :name ) AND is_active = :active", { name: "%#{params[:department_name]}%", active: true } ])
      else
        Department.where(["LOWER(name) LIKE LOWER('%#{params[:department_name]}%') AND is_active = :active",
          { active: params[:is_active].to_bool }])
      end
    end

    def self.active
        Department.where(['is_active = :active', { active: true }]).order(:name)
    end
end
