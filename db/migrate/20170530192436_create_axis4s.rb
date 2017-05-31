class CreateAxis4s < ActiveRecord::Migration
  def change
    create_table :axis4s do |t|
      t.string :i_3_4_1
      t.string :i_3_4_2
      t.string :i_3_4_3
      t.string :i_3_4_4
      t.string :i_3_4_5
      t.string :i_3_4_6
      t.string :i_3_4_7
      t.string :i_3_4_8
      t.string :i_3_4_9

      t.timestamps null: false
    end
  end
end
