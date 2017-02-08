class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :viver_em_espacos_publicos_em_mas_condicoes
      t.string :viver_com_pessoas_de_alto_risco
      t.string :viver_em_lugares_de_consumo
      t.string :viver_em_lugares_sem_higiene_nem_servicos_basicos
      t.string :moradia_precaria
      t.string :viver_em_estruturas_semelhantes_ao_cortico
      t.string :viver_em_zonas_com_presenca_de_grupos_armados_a_margem_da_lei
      t.string :vivir_en_superlotacao
      t.string :viver_em_uma_comunidade_de_alto_risco

      t.timestamps null: false
    end
  end
end
