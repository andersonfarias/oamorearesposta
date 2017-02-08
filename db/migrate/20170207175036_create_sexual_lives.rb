class CreateSexualLives < ActiveRecord::Migration
  def change
    create_table :sexual_lives do |t|
      t.string :nao_utiliza_preservativos
      t.string :ter_relacoes_sexuais_com_companheiros_perigosos_
      t.string :ter_relacoes_sexuais_sob_efeito_de_droga_intoxicado_etc
      t.string :ter_relacoes_sexuais_de_maneira_desprotegida_com_o_a_parceiro_a
      t.string :ter_relacoes_sexuais_em_lugares_de_alto_risco
      t.string :iniciar_a_vida_sexual_precocemente_sem_infomacoes
      t.string :nao_tomar_em_conta_periodo_latente_nos_testes_clinicos_para_hiv
      t.string :nao_fazer_testes_medicos_periodicos
      t.string :nao_fazer_teste_clinico_apos_relacao_sexual_sem_preservativo

      t.timestamps null: false
    end
  end
end
