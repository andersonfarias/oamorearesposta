class CreateAxis1s < ActiveRecord::Migration[4.2]
  def change
    create_table :axis1s do |t|
      t.string :i_3_1_1
      t.string :i_3_1_2
      t.string :i_3_1_3
      t.string :i_3_1_4

      t.timestamps null: false
    end
  end
end
