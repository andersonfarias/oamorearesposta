class Job < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		Job.new(
			ter_ocupacao_ilegal: "0",
			estar_sem_trabalho_ou_sem_ocupacao: "0",
			trabalhar_em_lugares_que_promove_ou_exigem_o_consumo_de_drogas: "0",
			ter_ocupacao_de_alto_risco_relacionado_a_drogas_ou_seguranca: "0",
			ter_um_trabalho_no_qual_ha_exploracao_grave_de_mao_de_obra: "0",
			vive_em_um_contexto_onde_nao_ha_oportunidades_de_trabalho: "0")
	end
end
