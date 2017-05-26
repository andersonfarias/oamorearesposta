class Albergue < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Albergue.new(
			recebeu_acolhida_durante_a_noite: "0",
			recebeu_acolhida_durante_o_dia: "0",
			a_pessoa_teve_acesso_a_um_chuveiro: "0",
			a_pessoa_recebeu_produtos_para_banho: "0",
			a_pessoa_teve_acesso_ao_banheiro: "0",
			a_pessoa_recebeu_roupa_limpa: "0",
			a_pessoa_pode_lavar_sua_roupa: "0",
			a_pessoa_recebeu_comida_cafe_cha_biscoitos_etc: "0",
			a_pessoa_recebeu_alimentaco_completa: "0",
			a_pessoa_recebeu_apoio_financeiro_para_algum_servico: "0",
			a_pessoa_recebeu_alguma_bolsa_de_estudo: "0",
			foi_ajudada_em_momentos_de_perigo: "0",
			apoio_para_o_parto: "0",
			transporte: "0",
			proteco_para_os_filhos_as: "0",
			defesa_legal: "0",
			fianca_para_sair_da_priso: "0",
			documentaco: "0")
	end
end
