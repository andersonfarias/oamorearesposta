class CreatePartners < ActiveRecord::Migration[4.2]
  def change
    create_table :partners do |t|
      t.references :person, index: true, foreign_key: true
      t.string :fantasy_name
      t.references :contact_person_1, foreign_key: { to_table: :people }
      t.references :contact_person_2, foreign_key: { to_table: :people }
      t.string :cnpj
      t.integer :partner_type
      t.boolean :is_active, default: true
      t.string :work_areas

      t.timestamps null: false
    end
  end
end
