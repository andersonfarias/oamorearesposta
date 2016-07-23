class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.references :person, index: true, foreign_key: true
      t.string :fantasy_name
      t.references :people, :contact_person_1
      t.references :people, :contact_person_2
      t.string :cnpj
      t.integer :partner_type
      t.boolean :is_active, default: true
      t.string :work_areas

      t.timestamps null: false
    end
  end
end
