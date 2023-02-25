class AddCpfToPeople < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :cpf, :string
  end
end
