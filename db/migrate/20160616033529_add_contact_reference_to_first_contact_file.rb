class AddContactReferenceToFirstContactFile < ActiveRecord::Migration
  def change
    add_reference :first_contact_files, :contact_source, references: :people
  end
end
