class AddConsumirAlcoolToDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :consumir_alcool, :string
  end
end
