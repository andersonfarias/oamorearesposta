class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighboor
      t.string :number
      t.string :cep
      t.text :complement
      t.references :city, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
