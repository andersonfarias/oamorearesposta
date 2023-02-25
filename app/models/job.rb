class Job < ApplicationRecord
	has_one :dependent_variable

	def self.init
		Job.new(
			ter_ocupacao_ilegal: "0",
			estar_sem_trabalho_ou_sem_ocupacao: "0",
			trabalhar_em_lugares_que_promove_ou_exigem_o_consumo_de_drogas: "0",
			ter_ocupacao_de_alto_risco_relacionado_a_drogas_ou_seguranca: "0",
			ter_um_trabalho_no_qual_ha_exploracao_grave_de_mao_de_obra: "0",
			vive_em_um_contexto_onde_nao_ha_oportunidades_de_trabalho: "0",
			mantem_se_com_dinheiro_ilegal: "0",
			nao_tem_officio_ou_habilidades: "0",
			traficar_drogas: "0")
	end
end
