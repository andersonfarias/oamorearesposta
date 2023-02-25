class CreateMainNetworks < ActiveRecord::Migration[4.2]
  def change
    create_table :main_networks do |t|
      t.string :i_9_1
      t.string :i_9_2
      t.string :i_9_3
      t.string :i_9_4
      t.string :i_9_5
      t.string :i_9_6
      t.string :i_9_7
      t.string :i_9_8
      t.string :i_9_9
      t.string :i_9_10
      t.string :i_9_11
      t.string :i_9_12
      t.string :i_9_13
      t.string :i_9_14
      t.string :i_9_15
      t.string :i_9_16

      t.timestamps null: false
    end
  end
end
