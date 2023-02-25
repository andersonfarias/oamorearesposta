class CreateDependentHealths < ActiveRecord::Migration[4.2]
  def change
    create_table :dependent_healths do |t|
      t.string :vive_com_hiv_e_tem_relacoes_sexuais_sem_protecao
      t.string :nao_tem_direito_a_medicamentos_vitais
      t.string :tem_sida_hiv
      t.string :e_hiv_positivo
      t.string :tem_hepatite
      t.string :consumir_drogas_durante_a_gravidez
      t.string :ter_uma_gravidez_em_situacao_de_risco
      t.string :tem_dst_ets_std
      t.string :não_tem_acesso_a_servicos_medicos_basicos
      t.string :praticar_construcoes_corporais_sem_condicoes_medicas_adequadas
      t.string :ter_doencas_e_nao_se_tratar
      t.string :ter_passado_por_aborto_mal_feito
      t.string :tem_tuberculose
      t.string :gravidez_indesejada

      t.timestamps null: false
    end
  end
end
