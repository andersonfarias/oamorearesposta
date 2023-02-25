class AddLastNameToPerson < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :last_name, :string
  end
end
