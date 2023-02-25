class InvolvedStructure < ApplicationRecord
	has_one :independent_variable

	def self.init
		InvolvedStructure.new(
			territorios_comunitarios: "0",
			ha_bens_e_serviços_na_comunidade_tidos_como_naturais: "0",
			recursos_oferecidos_pelos_atores_tidos_como_privados: "0",
			centros_de_baixa_de_exigencia_e_baixa_complexidade: "0",
			centros_de_baixa_de_exigencia_e_media_complexidade: "0",
			centros_de_baixa_de_exigencia_e_alta_complexidade: "0")
	end
end
