class Hygiene < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		Hygiene.new(
			trocar_de_roupa_menos_de_uma_vez_por_semana: "0",
			tomar_banho_menos_de_uma_vez_por_semana: "0",
			nao_ter_um_lugar_para_tomar_banho: "0",
			nao_ter_roupa_limpa: "0",
			nao_cuidar_da_limpeza_de_seu_espaco_moradia: "0",
			lavar_sua_roupa_menos_de_uma_vez_por_semana: "0")
	end
end
