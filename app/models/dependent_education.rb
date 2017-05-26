class DependentEducation < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		DependentEducation.new(
			nao_tem_recursos_financeiros_para_estudar: "0",
			se_encontra_em_contextos_escolares_negativos: "0",
			ausenta_se_da_escola_capacitacao: "0",
			nao_tem_capacitacao_tecnica_e_ou_profissional: "0",
			nao_tem_ocupacao_ou_habilidades_produtivas: "0",
			tem_problemas_de_aprendizagem: "0",
			nao_completou_escola_secundaria: "0",
			nao_compretou_a_escola_primaria: "0",
			nao_saber_ler: "0",
			nao_sabe_escrever: "0",
			nao_sabe_fazer_calculos_basicos: "0")
	end
end
