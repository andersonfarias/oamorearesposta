class FilePicture < ApplicationRecord
	belongs_to :activity_diary, optional: true

	validate :type_validation

	private
	def type_validation
		types = "%w{image/jpeg image/png}"
		unless types.include? self.content_type
			errors.add(:files, 'Tipo não aceito')
		end
	end
end
