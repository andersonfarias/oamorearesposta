class CreateBasicAssistances < ActiveRecord::Migration
  def change
    create_table :basic_assistances do |t|
      t.string :i_10_1
      t.string :i_10_2
      t.string :i_10_3
      t.string :i_10_4
      t.string :i_10_5
      t.string :i_10_6
      t.string :i_10_7
      t.string :i_10_8
      t.string :i_10_9
      t.string :i_10_10
      t.string :i_10_11
      t.string :i_10_12
      t.string :i_10_13
      t.string :i_10_14
      t.string :i_10_15

      t.timestamps null: false
    end
  end
end
