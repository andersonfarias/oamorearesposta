class CreatePhones < ActiveRecord::Migration[4.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
