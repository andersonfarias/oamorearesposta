class AddPersonIdToUser < ActiveRecord::Migration[4.2]
	def change
		add_reference :users, :person, index: true, foreign_key: true
	end
end