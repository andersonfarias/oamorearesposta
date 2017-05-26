class Legality < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		Legality.new(
			cometer_roubos: "0",
			cometer_assaltos: "0",
			traficar_drogas: "0",
			pertencer_a_grupos_criminosos_e_quadrilhas: "0",
			estar_na_prisao: "0",
			participar_em_acoes_criminosas: "0",
			consumir_drogas_em_lugares_publicos: "0",
			ter_documentos_falsos: "0",
			portar_armas_sem_salvo_conduto_e_armas_brancas: "0",
			manter_se_com_dinheiro_e_produtos_de_atividades_criminosas: "0",
			ter_estado_privado_de_liberdade: "0",
			estar_sem_documentos_legais_de_imigrante: "0",
			nao_ter_documentos_de_identidade: "0",
			cometer_homicidios_ou_produzir_lesoes_a_outrem: "0",
			ser_fugitivo_da_justica_ou_reu_ausente: "0")
	end
end
