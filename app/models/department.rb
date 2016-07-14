class Department < ActiveRecord::Base
    has_many :beneficiaries

    validates_presence_of :name

    def self.by_name(params)
        Department.where(["LOWER(name) LIKE LOWER('%#{params[:department_name]}%') AND is_active = :active", { active: TRUE }])
    end
end
