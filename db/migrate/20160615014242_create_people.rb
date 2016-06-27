class CreatePeople < ActiveRecord::Migration
	def change
		create_table :people do |t|
			t.string :name
			t.integer :age, default: 0
			t.integer :gender

			t.timestamps null: false
		end
	end
end
