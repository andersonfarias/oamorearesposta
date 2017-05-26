class ProblemsDuringProcess < ActiveRecord::Base
	has_one :evaluation

	def self.init
		ProblemsDuringProcess.new(
			sustancias_alcool: "0",
			condutas_antissociais: "0",
			psiquiatricas: "0",
			comportamentais: "0",
			relacionais: "0",
			violencia_intrafamiliar: "0",
			violacao_abuso_sexual_adultos: "0",
			trabalho_sexual: "0",
			legal: "0",
			gravidez_parto: "0",
			doencas: "0",
			pobreza_extrema: "0",
			vida_na_rua: "0",
			apoio_econômico: "0",
			escolares: "0",
			exclusao_grave: "0",
			violencia_intracomunitaria: "0",
			redes_interinstitucionais: "0",
			crises_psicologicas: "0",
			capacitacao_e_formacao: "0",
			organizacao_e_planejamento: "0",
			hiv: "0",
			enfermidades_por_transmissao_sexual: "0",
			trafico_de_pessoas: "0",
			sem_trabalho: "0",
			tuberculose: "0",
			problemas_familiares: "0",
			transtorno_de_estres_pos_traumatico: "0",
			analfabetismo: "0",
			problemas_sexuais: "0",
			violacao_abuso_de_criancas: "0",
			outras_dependencias: "0",
			uso_de_drogas_intravenosa: "0",
			hepatites: "0",
			deslocacao_forcada: "0",
			migracao_ou_imigracao: "0",
			estigma_por_sua_identidade_sexual: "0")
	end
end
