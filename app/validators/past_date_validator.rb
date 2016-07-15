class PastDateValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if (not value.blank?) && (value > Date.today)
            record.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.messages.future_date'))
        end
    end
end
