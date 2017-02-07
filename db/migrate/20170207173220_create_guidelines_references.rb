class CreateGuidelinesReferences < ActiveRecord::Migration
  def change
    create_table :guidelines_references do |t|
      t.integer :foi_orientado_informado_ou_encaminhado_para_uma_escola_curso_ou_atividade_educativa_
      t.integer :a_gesteo_da_iniciativa_e_feita_em_conjunto
      t.integer :esta_iniciativa_foi_avaliada_em_conjunto_01
      t.integer :orientacao_indicacao_encaminhamento_para_uma_oficina_de_capacitacao_para_o_trabalho
      t.integer :esta_iniciativa_e_implementada_conjuntamente_01
      t.integer :esta_iniciativa_foi_avaliada_em_conjunto_02
      t.integer :orientacao_referente_a_uma_agencia_de_tratamento
      t.integer :a_gestao_da_iniciativa_e_feita_em_conjunto_01
      t.integer :esta_iniciativa_foi_avaliada_em_conjunto_03
      t.integer :orientacao_referente_a_uma_agencia_de_tratamento_nao_registrada
      t.integer :a_gestao_da_iniciativa_e_feita_em_conjunto_02
      t.integer :esta_iniciativa_foi_avaliada_em_conjunto_04
      t.integer :a_pessoa_recebeu_orientacao_para_uma_possibilidade_de_trabalho
      t.integer :a_gestao_da_iniciativa_e_feita_em_conjunto_03
      t.integer :esta_iniciativa_foi_avaliada_em_conjunto_05
      t.integer :orientacao_sobre_um_hospital_ou_um_serviço_medico
      t.integer :esta_iniciativa_e_implementada_conjuntamente_02
      t.integer :esta_iniciativa_foi_avaliada_em_conjunto_06
      t.integer :orientacoes_sobre_atividades_e_grupos_de_participacao_sociocultural
      t.integer :esta_iniciativa_e_implementada_conjuntamente_003
      t.integer :esta_iniciativa_foi_avaliada_em_conjunto_07

      t.timestamps null: false
    end
  end
end
