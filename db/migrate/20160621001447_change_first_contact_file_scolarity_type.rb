class ChangeFirstContactFileScolarityType < ActiveRecord::Migration[4.2]
  def change
    change_column :first_contact_files, :scolarity, :string
  end
end
