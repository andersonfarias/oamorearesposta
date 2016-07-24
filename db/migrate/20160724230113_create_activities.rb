class CreateActivities < ActiveRecord::Migration
    def change
        create_table :activities do |t|
            t.string :name
            t.text :description
            t.string :axis
            t.references :department, index: true, foreign_key: true
            t.boolean :is_active, default: true

            t.timestamps null: false
        end
    end
end
