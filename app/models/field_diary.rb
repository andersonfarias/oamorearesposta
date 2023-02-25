class FieldDiary < ApplicationRecord
	belongs_to :user, inverse_of: :first_contact_files, optional: true

	validates_associated :user
end
