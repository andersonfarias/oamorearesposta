class AddBirthdateToPerson < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :birthdate, :date
  end
end
