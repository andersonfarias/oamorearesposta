class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :ter_ocupacao_ilegal
      t.string :estar_sem_trabalho_ou_sem_ocupacao
      t.string :trabalhar_em_lugares_onde_se_promova_ou_exigem_o_consumo_de_drogas
      t.string :ter_uma_ocupacao_de_alto_risco_relacionado_com_as_drogas_ou_seguranca_pessoal
      t.string :ter_um_trabalho_no_qual_ha_exploracao_grave_de_mao_de_obra
      t.string :vive_em_um_contexto_onde_nao_ha_oportunidades_de_trabalho

      t.timestamps null: false
    end
  end
end
