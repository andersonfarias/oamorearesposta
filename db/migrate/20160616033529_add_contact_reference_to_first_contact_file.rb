class AddContactReferenceToFirstContactFile < ActiveRecord::Migration[4.2]
  def change
    add_reference :first_contact_files, :contact_source, references: :people
  end
end
