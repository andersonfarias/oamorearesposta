class ChangeColumnNameToFirstNameInPerson < ActiveRecord::Migration[4.2]
  def change
    rename_column :people, :name, :first_name
  end
end
