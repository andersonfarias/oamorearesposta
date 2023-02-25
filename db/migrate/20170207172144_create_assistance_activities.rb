class CreateAssistanceActivities < ActiveRecord::Migration[4.2]
  def change
    create_table :assistance_activities do |t|
      t.string :foi_ministrado_medicamentos
      t.string :foram_tratadas_as_feridas
      t.string :foi_realizado_diagnosticos
      t.string :foi_trocada_as_seringas
      t.string :foi_distribuido_preservativos
      t.string :foi_dado_medicamentos_para_hiv
      t.string :foi_dado_medicamentos_para_dst
      t.string :foi_realizado_teste_clinico_para_hiv
      t.string :foi_realizado_teste_clinico_para_dst
      t.string :foi_realizado_teste_clinico_para_tb
      t.string :foi_ministrado_medicamentos_para_tb
      t.string :foi_realizado_tratamentos_substitutivos

      t.timestamps null: false
    end
  end
end
