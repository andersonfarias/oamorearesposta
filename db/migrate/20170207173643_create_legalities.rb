class CreateLegalities < ActiveRecord::Migration[4.2]
  def change
    create_table :legalities do |t|
      t.string :cometer_roubos
      t.string :cometer_assaltos
      t.string :traficar_drogas
      t.string :pertencer_a_grupos_criminosos_e_quadrilhas
      t.string :estar_na_prisao
      t.string :participar_em_acoes_criminosas
      t.string :consumir_drogas_em_lugares_publicos
      t.string :ter_documentos_falsos
      t.string :portar_armas_sem_salvo_conduto_e_armas_brancas
      t.string :manter_se_com_dinheiro_e_produtos_de_atividades_criminosas
      t.string :ter_estado_privado_de_liberdade
      t.string :estar_sem_documentos_legais_de_imigrante
      t.string :nao_ter_documentos_de_identidade
      t.string :cometer_homicidios_ou_produzir_lesoes_a_outrem
      t.string :ser_fugitivo_da_justica_ou_reu_ausente

      t.timestamps null: false
    end
  end
end
