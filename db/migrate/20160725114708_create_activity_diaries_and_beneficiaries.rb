class CreateActivityDiariesAndBeneficiaries < ActiveRecord::Migration[4.2]
    def change
        create_table :attendances do |t|
            t.belongs_to :activity_diary, index: true
            t.belongs_to :beneficiary, index: true
            t.text :observation

            t.timestamps null: false
        end
    end
end
