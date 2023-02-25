class AddUsarDrogarPesadasToDrug < ActiveRecord::Migration[4.2]
  def change
    add_column :drugs, :usar_drogas_pesadas, :string
  end
end
