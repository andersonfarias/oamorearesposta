class CommunityTreatment < ApplicationRecord
	has_one :independent_variable

	def self.init
		CommunityTreatment.new(
			a_equipe_foi_envolvida: "0",
			a_rede_subjetiva_comunitaria_foi_envolvida: "0",
			a_rede_operativa_foi_envolvida: "0",
			a_rede_de_recursos_comunitarios_foi_envolvida: "0",
			a_rede_de_lideres_de_opiniao_foi_envolvida: "0",
			a_rede_subjetiva_do_parceiro_foi_envolvida: "0")
	end
end
