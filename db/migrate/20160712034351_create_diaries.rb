class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.text :description
      t.date :date
      t.references :user, index: true, foreign_key: true
      t.references :beneficiary, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
