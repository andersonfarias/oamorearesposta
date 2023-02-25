class CreateJobs < ActiveRecord::Migration[4.2]
  def change
    create_table :jobs do |t|
      t.string :ter_ocupacao_ilegal
      t.string :estar_sem_trabalho_ou_sem_ocupacao
      t.string :trabalhar_em_lugares_que_promove_ou_exigem_o_consumo_de_drogas
      t.string :ter_ocupacao_de_alto_risco_relacionado_a_drogas_ou_seguranca
      t.string :ter_um_trabalho_no_qual_ha_exploracao_grave_de_mao_de_obra
      t.string :vive_em_um_contexto_onde_nao_ha_oportunidades_de_trabalho

      t.timestamps null: false
    end
  end
end
