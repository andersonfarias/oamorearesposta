class CreateActivityDiaries < ActiveRecord::Migration[4.2]
    def change
        create_table :activity_diaries do |t|
            t.references :diary, index: true, foreign_key: true
            t.references :activity, index: true, foreign_key: true

            t.timestamps null: false
        end
    end
end
