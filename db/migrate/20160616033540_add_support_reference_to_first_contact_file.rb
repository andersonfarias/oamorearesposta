class AddSupportReferenceToFirstContactFile < ActiveRecord::Migration
  def change
    add_reference :first_contact_files, :support, references: :people
  end
end
