class CreateSexualLives < ActiveRecord::Migration
  def change
    create_table :sexual_lives do |t|
      t.integer :nao_utiliza_preservativos
      t.integer :ter_relacoes_sexuais_com_companheiros_perigosos_
      t.integer :ter_relacoes_sexuais_sob_efeito_de_droga_intoxicado_etc
      t.integer :ter_relacoes_sexuais_de_maneira_desprotegida_com_o_a_parceiro_a
      t.integer :ter_relacoes_sexuais_em_lugares_de_alto_risco
      t.integer :iniciar_a_vida_sexual_precocemente_sem_infomacoes
      t.integer :nao_tomar_em_conta_o_periodo_de_latencia_nos_testes_clinicos_para_hiv
      t.integer :nao_fazer_testes_medicos_periodicos
      t.integer :nao_fazer_um_teste_clinico_depois_de_uma_relacao_sexual_sem_preservativo

      t.timestamps null: false
    end
  end
end
