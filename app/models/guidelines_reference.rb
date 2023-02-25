class GuidelinesReference < ApplicationRecord
	has_one :independent_variable

	def self.init
		GuidelinesReference.new(
			foi_orientado_informado_ou_encaminhado_para_uma_escola: "0",
			a_gesteo_da_iniciativa_e_feita_em_conjunto: "0",
			esta_iniciativa_foi_avaliada_em_conjunto_01: "0",
			orientacao_indicacao_encaminhamento_para_uma_oficina: "0",
			esta_iniciativa_e_implementada_conjuntamente_01: "0",
			esta_iniciativa_foi_avaliada_em_conjunto_02: "0",
			orientacao_referente_a_uma_agencia_de_tratamento: "0",
			a_gestao_da_iniciativa_e_feita_em_conjunto_01: "0",
			esta_iniciativa_foi_avaliada_em_conjunto_03: "0",
			orientacao_referente_a_uma_agencia_de_tratamento_nao_registrada: "0",
			a_gestao_da_iniciativa_e_feita_em_conjunto_02: "0",
			esta_iniciativa_foi_avaliada_em_conjunto_04: "0",
			a_pessoa_recebeu_orientacao_para_uma_possibilidade_de_trabalho: "0",
			a_gestao_da_iniciativa_e_feita_em_conjunto_03: "0",
			esta_iniciativa_foi_avaliada_em_conjunto_05: "0",
			orientacao_sobre_um_hospital_ou_um_serviço_medico: "0",
			esta_iniciativa_e_implementada_conjuntamente_02: "0",
			esta_iniciativa_foi_avaliada_em_conjunto_06: "0",
			orientacoes_sobre_atividades_grupos_participacao_sociocultural: "0",
			esta_iniciativa_e_implementada_conjuntamente_003: "0",
			esta_iniciativa_foi_avaliada_em_conjunto_07: "0")
	end
end
