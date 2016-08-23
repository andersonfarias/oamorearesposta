class ActivityDiary < ActiveRecord::Base
    belongs_to :diary
    belongs_to :activity
    has_many :attendances, dependent: :destroy
    has_many :beneficiaries, through: :attendances
    has_many :file_pictures, dependent: :destroy

    validates_presence_of :diary, :activity
    validates_associated :diary, :activity

    validate :has_at_least_one_beneficiary?
    validate :diary_has_description?
    validate :attendance_with_same_beneficiary?

    def has_at_least_one_beneficiary?
        errors.add :base, I18n.t('errors.messages.at_least_one_presence') if attendances.blank?
    end

    def diary_has_description?
        errors.add :diary_description_error, I18n.t('errors.messages.blank') if diary.description.blank?
    end

    def attendance_with_same_beneficiary?
        beneficiaries_frequency = Hash.new
        attendances.each do |a|
            key = a.beneficiary.person.first_name
            value = beneficiaries_frequency.key?(key) ? beneficiaries_frequency[key] + 1 : 1

            beneficiaries_frequency[key] = value
        end

        names = ''
        beneficiaries_frequency.keys.each do |a|
            next unless beneficiaries_frequency[a] > 1
            names = names + ', ' unless names.blank?
            names += a
        end

        message = I18n.t('errors.messages.repeated_beneficiary_presence') + ': ' + names
        if self.errors.key?(:base)
            if self.errors[:base].include?(message)
              return
            end
        end

        errors.add :base, message unless names.blank?
    end

    accepts_nested_attributes_for :attendances

    scope :by_activity, ->(id) { joins(:diary).where(activity_id: id).order('diaries.date DESC, id DESC') }
end
