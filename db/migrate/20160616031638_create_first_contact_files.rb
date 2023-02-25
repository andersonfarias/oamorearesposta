class CreateFirstContactFiles < ActiveRecord::Migration[4.2]
  def change
    create_table :first_contact_files do |t|
      t.date :date
      t.integer :hour
      t.string :institution
      t.integer :operational_context_first_contact
      t.integer :how_established_first_contact
      t.integer :contact_source_type
      t.integer :how_person_knew_about_the_organization
      t.integer :beneficiary_and_contact_source_relationship
      t.boolean :is_new_partner
      t.integer :number_of_previous_treatments
      t.integer :place_of_previous_treatments
      t.integer :marital_status
      t.integer :number_sons
      t.integer :number_daughters
      t.integer :ethnic_group
      t.string :religion
      t.integer :family_structure
      t.integer :scolarity
      t.integer :job
      t.string :first_contact_conditions
      t.string :petitions
      t.string :answer
      t.string :results
      t.text :comments
      t.references :beneficiary, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
