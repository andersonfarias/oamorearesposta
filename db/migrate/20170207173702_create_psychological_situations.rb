class CreatePsychologicalSituations < ActiveRecord::Migration
  def change
    create_table :psychological_situations do |t|
      t.string :viver_uma_depressao
      t.string :viver_experiencias_psicoticas
      t.string :viver_transtornos_de_limites_de_personalidade
      t.string :viver_situacao_de_panico
      t.string :transtorno_de_ansiedade
      t.string :personalidade_antissocial
      t.string :alteracoes_graves_do_humor_devido_ao_abuso_de_substancias
      t.string :somatizar_situacoes_de_estres_ou_conflito
      t.string :viver_situacoes_de_luto
      t.string :transtorno_por_estres_pos_traumatico
      t.string :troca_de_conduta_depois_de_ter_sido_vitima_de_violencia
      t.string :teve_pensamentos_de_suicidio
      t.string :tentou_suicidio
      t.string :lhe_foi_receitado_algum_medicamento_por_problema_psicologico

      t.timestamps null: false
    end
  end
end
