class User < ApplicationRecord
    enum role: [:admin, :social_worker, :psycologist, :educator, :coordinator, :user]
    after_initialize :set_default_role, if: :new_record?

    def set_default_role
        self.role ||= :user
    end

    belongs_to :person, dependent: :destroy, optional: true
    belongs_to :partner, optional: true
    has_many :first_contact_files, inverse_of: :user
    validates_associated :person, :partner
    validates_presence_of :person, :partner
    validate :email_presence

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :trackable, :validatable, :timeoutable

    def to_s
        person.full_name
    end

    def self.by_name(params)
        args = { name: "%#{params[:user_name]}%", active: true }
        User.joins(:person).where(['LOWER(people.first_name) LIKE LOWER( :name ) AND is_active = :active', args]).order('people.first_name')
    end

    def self.by_name_and_email(params)
        if params[:is_active].nil? || params[:is_active].empty?
            User.joins(:person).where(["(LOWER(people.first_name) LIKE LOWER('%#{params[:name]}%') OR LOWER(people.last_name) LIKE LOWER('%#{params[:name]}%'))
                AND LOWER(users.email) LIKE LOWER('%#{params[:email]}%') AND is_active = :active", { name: "%#{params[:department_name]}%", active: true }])
        else
            User.joins(:person).where(["LOWER(people.first_name) LIKE LOWER('%#{params[:name]}%')
                AND LOWER(users.email) LIKE LOWER('%#{params[:email]}%') AND users.is_active = :active",
                                       { active: params[:is_active].to_bool }])
        end
    end

    def active_for_authentication?
        super && is_active
    end

    def inactive_message
        is_active ? super : "Usu\u00E1rio desativado."
    end

    def email_presence
        if person.email.nil? || person.email.blank?
            errors[:email] << 'Email deve ser informado.'
        end
    end
end
