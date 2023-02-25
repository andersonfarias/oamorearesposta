class DependentHealth < ApplicationRecord
	has_one :dependent_variable

	def self.init
		DependentHealth.new(
			vive_com_hiv_e_tem_relacoes_sexuais_sem_protecao: "0",
			nao_tem_direito_a_medicamentos_vitais: "0",
			tem_sida_hiv: "0",
			e_hiv_positivo: "0",
			tem_hepatite: "0",
			consumir_drogas_durante_a_gravidez: "0",
			ter_uma_gravidez_em_situacao_de_risco: "0",
			tem_dst_ets_std: "0",
			não_tem_acesso_a_servicos_medicos_basicos: "0",
			praticar_construcoes_corporais_sem_condicoes_medicas_adequadas: "0",
			ter_doencas_e_nao_se_tratar: "0",
			ter_passado_por_aborto_mal_feito: "0",
			tem_tuberculose: "0",
			gravidez_indesejada: "0",
			nao_utiliza_preservativos: "0",
			vida_sexual_precoce: "0",
			nao_faz_testes_medicos: "0")
	end
end
