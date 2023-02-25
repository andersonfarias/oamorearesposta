class AddMisturarMedicamentosToDrug < ActiveRecord::Migration[4.2]
  def change
    add_column :drugs, :misturar_medicamentos, :string
  end
end
