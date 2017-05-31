class CreateAxis2s < ActiveRecord::Migration
  def change
    create_table :axis2s do |t|
      t.string :i_3_2_1
      t.string :i_3_2_2
      t.string :i_3_2_3
      t.string :i_3_2_4

      t.timestamps null: false
    end
  end
end
