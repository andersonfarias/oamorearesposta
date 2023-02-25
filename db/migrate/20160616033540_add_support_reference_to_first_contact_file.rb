class AddSupportReferenceToFirstContactFile < ActiveRecord::Migration[4.2]
  def change
    add_reference :first_contact_files, :support, references: :people
  end
end
