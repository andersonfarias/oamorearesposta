class SexualLife < ApplicationRecord
  has_one :dependent_variable

  def self.init
  	SexualLife.new(
  		nao_utiliza_preservativos: "0",
		ter_relacoes_sexuais_com_companheiros_perigosos_: "0",
		ter_relacoes_sexuais_sob_efeito_de_droga_intoxicado_etc: "0",
		ter_relacoes_sexuais_de_maneira_desprotegida_com_o_a_parceiro_a: "0",
		ter_relacoes_sexuais_em_lugares_de_alto_risco: "0",
		iniciar_a_vida_sexual_precocemente_sem_infomacoes: "0",
		nao_tomar_em_conta_periodo_latente_nos_testes_clinicos_para_hiv: "0",
		nao_fazer_testes_medicos_periodicos: "0",
		nao_fazer_teste_clinico_apos_relacao_sexual_sem_preservativo: "0")
  end
end
