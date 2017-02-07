class CreateAlbergues < ActiveRecord::Migration
  def change
    create_table :albergues do |t|
      t.string :recebeu_acolhida_durante_a_noite
      t.string :recebeu_acolhida_durante_o_dia
      t.string :a_pessoa_teve_acesso_a_um_chuveiro
      t.string :a_pessoa_recebeu_produtos_para_banho
      t.string :a_pessoa_teve_acesso_ao_banheiro
      t.string :a_pessoa_recebeu_roupa_limpa
      t.string :a_pessoa_pode_lavar_sua_roupa
      t.string :a_pessoa_recebeu_comida_cafe_cha_biscoitos_etc
      t.string :a_pessoa_recebeu_alimentaco_completa
      t.string :a_pessoa_recebeu_apoio_financeiro_para_algum_servico
      t.string :a_pessoa_recebeu_alguma_bolsa_de_estudo
      t.string :foi_ajudada_em_momentos_de_perigo
      t.string :apoio_para_o_parto
      t.string :transporte
      t.string :proteco_para_os_filhos_as
      t.string :defesa_legal
      t.string :fianca_para_sair_da_priso
      t.string :documentaco

      t.timestamps null: false
    end
  end
end
