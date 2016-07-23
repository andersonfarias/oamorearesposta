class User < ActiveRecord::Base
    enum role: [:admin, :social_worker, :psycologist, :educator, :coordinator, :user]
    after_initialize :set_default_role, if: :new_record?

    def set_default_role
        self.role ||= :user
    end

    belongs_to :person, dependent: :destroy
    belongs_to :partner
    has_many :first_contact_files, inverse_of: :user
    validates_associated :person, :partner
    validates_presence_of :person, :partner
    validate :email_presence

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :trackable, :validatable, :timeoutable

    def self.by_name_and_email(params)
        if params[:is_active].nil? or params[:is_active].empty?
            User.joins(:person).where(["(LOWER(people.first_name) LIKE LOWER('%#{params[:name]}%') OR LOWER(people.last_name) LIKE LOWER('%#{params[:name]}%'))
                AND LOWER(users.email) LIKE LOWER('%#{params[:email]}%') AND is_active = :active", { name: "%#{params[:department_name]}%", active: TRUE } ])
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
