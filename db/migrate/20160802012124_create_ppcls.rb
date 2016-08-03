class CreatePpcls < ActiveRecord::Migration
  def change
    create_table :ppcls do |t|
      t.string :name
      t.string :dc_reference
      t.integer :age
      t.integer :gender
      t.string :relationship
      t.string :social_role
      t.integer :partner_device
      t.integer :treatment_device
      t.integer :institutional_device
      t.references :beneficiary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
