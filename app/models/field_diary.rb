class FieldDiary < ActiveRecord::Base
	belongs_to :user, inverse_of: :first_contact_files

	validates_associated :user
end
