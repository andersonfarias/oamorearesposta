class ChangeFirstContactFileScolarityType < ActiveRecord::Migration
  def change
    change_column :first_contact_files, :scolarity, :string
  end
end
