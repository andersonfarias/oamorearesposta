class AddMisturarMedicamentosToDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :misturar_medicamentos, :string
  end
end
