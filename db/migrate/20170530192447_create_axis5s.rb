class CreateAxis5s < ActiveRecord::Migration
  def change
    create_table :axis5s do |t|
      t.string :i_3_5_1
      t.string :i_3_5_2
      t.string :i_3_5_3
      t.string :i_3_5_4
      t.string :i_3_5_5

      t.timestamps null: false
    end
  end
end
