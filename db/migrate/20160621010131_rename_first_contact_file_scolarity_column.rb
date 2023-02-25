class RenameFirstContactFileScolarityColumn < ActiveRecord::Migration[4.2]
  def change
    rename_column :first_contact_files, :scolarity, :education_levels
  end
end
