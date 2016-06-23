class ChangePeopleAgeType < ActiveRecord::Migration
	def change
		change_column :people, :age, 'integer USING CAST(column_name AS integer)'
	end
end