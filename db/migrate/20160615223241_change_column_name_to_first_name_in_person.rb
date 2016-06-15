class ChangeColumnNameToFirstNameInPerson < ActiveRecord::Migration
  def change
    rename_column :people, :name, :first_name
  end
end
