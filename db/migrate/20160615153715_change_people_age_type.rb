class ChangePeopleAgeType < ActiveRecord::Migration
	def change
		change_column :people, :age, 'integer USING CAST(age AS integer)'
	end
end