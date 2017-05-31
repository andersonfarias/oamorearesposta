class CreateAxis3s < ActiveRecord::Migration
  def change
    create_table :axis3s do |t|
      t.string :i_3_3_1
      t.string :i_3_3_2
      t.string :i_3_3_3
      t.string :i_3_3_4

      t.timestamps null: false
    end
  end
end
