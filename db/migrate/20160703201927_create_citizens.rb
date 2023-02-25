class CreateCitizens < ActiveRecord::Migration[4.2]
  def change
    create_table :citizens do |t|
      t.boolean :leader
      t.string :social_role
      t.references :person, index: true, foreign_key: true
      t.references :comunity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
