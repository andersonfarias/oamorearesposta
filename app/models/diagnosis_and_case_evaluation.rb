class DiagnosisAndCaseEvaluation < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		DiagnosisAndCaseEvaluation.new(
			foi_realizado_um_diagnostico_individual: "0",
			foi_realizado_um_diagnostico_familiar: "0",
			foi_realizado_um_diagnostico_de_rede: "0",
			existe_uma_hpc_ficha_de_primeiro_contato: "0",
			existe_uma_spicl_seguimento_de_processos_em_comunidade_locais: "0",
			foi_realizada_uma_avaliacao_da_demanda: "0",
			foi_realizada_uma_avaliacao_dos_recursos_da_pessoa: "0",
			foi_realiazada_uma_avaliacao_dos_recursos_da_rede_subjetiva: "0",
			o_processo_de_tratamento_foi_programado_em_equipe: "0",
			o_processo_de_tratamento_foi_programa_pela_rede_operativa: "0",
			foram_definidos_os_objetivos_e_metas: "0",
			objetivos_e_metas_foram_avaliados: "0",
			foi_realizada_uma_avaliacao_formal: "0",
			o_processo_global_foi_avaliado_em_equipe: "0",
			o_processo_foi_concluido: "0",
			o_processo_foi_interrompido: "0",
			a_pessoa_faleceu: "0")
	end
end
