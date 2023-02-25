class CreateGuidelinesReferences < ActiveRecord::Migration[4.2]
  def change
    create_table :guidelines_references do |t|
      t.string :foi_orientado_informado_ou_encaminhado_para_uma_escola
      t.string :a_gesteo_da_iniciativa_e_feita_em_conjunto
      t.string :esta_iniciativa_foi_avaliada_em_conjunto_01
      t.string :orientacao_indicacao_encaminhamento_para_uma_oficina
      t.string :esta_iniciativa_e_implementada_conjuntamente_01
      t.string :esta_iniciativa_foi_avaliada_em_conjunto_02
      t.string :orientacao_referente_a_uma_agencia_de_tratamento
      t.string :a_gestao_da_iniciativa_e_feita_em_conjunto_01
      t.string :esta_iniciativa_foi_avaliada_em_conjunto_03
      t.string :orientacao_referente_a_uma_agencia_de_tratamento_nao_registrada
      t.string :a_gestao_da_iniciativa_e_feita_em_conjunto_02
      t.string :esta_iniciativa_foi_avaliada_em_conjunto_04
      t.string :a_pessoa_recebeu_orientacao_para_uma_possibilidade_de_trabalho
      t.string :a_gestao_da_iniciativa_e_feita_em_conjunto_03
      t.string :esta_iniciativa_foi_avaliada_em_conjunto_05
      t.string :orientacao_sobre_um_hospital_ou_um_serviço_medico
      t.string :esta_iniciativa_e_implementada_conjuntamente_02
      t.string :esta_iniciativa_foi_avaliada_em_conjunto_06
      t.string :orientacoes_sobre_atividades_grupos_participacao_sociocultural
      t.string :esta_iniciativa_e_implementada_conjuntamente_003
      t.string :esta_iniciativa_foi_avaliada_em_conjunto_07

      t.timestamps null: false
    end
  end
end