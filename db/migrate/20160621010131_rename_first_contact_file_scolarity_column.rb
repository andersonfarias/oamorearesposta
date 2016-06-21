class RenameFirstContactFileScolarityColumn < ActiveRecord::Migration
  def change
    rename_column :first_contact_files, :scolarity, :education_levels
  end
end
