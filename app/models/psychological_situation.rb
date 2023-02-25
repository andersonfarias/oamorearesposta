class PsychologicalSituation < ApplicationRecord
	has_one :dependent_variable

	def self.init
		PsychologicalSituation.new(
			viver_uma_depressao: "0",
			viver_experiencias_psicoticas: "0",
			viver_transtornos_de_limites_de_personalidade: "0",
			viver_situacao_de_panico: "0",
			transtorno_de_ansiedade: "0",
			personalidade_antissocial: "0",
			alteracoes_graves_do_humor_devido_ao_abuso_de_substancias: "0",
			somatizar_situacoes_de_estres_ou_conflito: "0",
			viver_situacoes_de_luto: "0",
			transtorno_por_estres_pos_traumatico: "0",
			troca_de_conduta_depois_de_ter_sido_vitima_de_violencia: "0",
			teve_pensamentos_de_suicidio: "0",
			tentou_suicidio: "0",
			lhe_foi_receitado_algum_medicamento_por_problema_psicologico: "0")
	end
end
