class AddConsumirAlcoolToDrug < ActiveRecord::Migration[4.2]
  def change
    add_column :drugs, :consumir_alcool, :string
  end
end
