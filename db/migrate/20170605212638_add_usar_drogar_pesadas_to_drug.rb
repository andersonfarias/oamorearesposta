class AddUsarDrogarPesadasToDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :usar_drogas_pesadas, :string
  end
end
