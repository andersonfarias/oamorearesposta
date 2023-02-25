class AddAttrsToDependentHealth < ActiveRecord::Migration[4.2]
  def change
    add_column :dependent_healths, :nao_utiliza_preservativos, :string
    add_column :dependent_healths, :vida_sexual_precoce, :string
    add_column :dependent_healths, :nao_faz_testes_medicos, :string
  end
end
