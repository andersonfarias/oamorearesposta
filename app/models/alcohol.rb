class Alcohol < ApplicationRecord
	has_one :dependent_variable

	def self.init
		Alcohol.new(
			tomar_alcool_durante_a_gravidez: "0",
			tomar_alcool_de_ma_qualidade: "0",
			trabalha_em_negocios_que_pedem_ou_exigem_o_consumo_de_licor: "0",
			mistura_o_consumo_de_alcool_com_outras_spa_ilicitas: "0",
			passar_de_uso_oral_para_outras_vias_nariz_intravenanosa_vagina: "0",
			uso_de_alcool: "0",
			nao_controlar_a_qualidade_da_substancia: "0",
			usar_simultaneamente_tipos_diferentes_de_alcool: "0",
			misturar_drogas_medicamentosa_com_o_consumo_de_alcool: "0",
			embriagar_se_sozinho: "0",
			tomar_grandes_quantidades_de_alcool: "0",
			tomar_alcool_de_fardos_contaminados_ou_sujos: "0",
			embriagar_se_em_grupo: "0",
			misturar_alcool_de_96_com_bebidas_a_gas: "0")
	end
end
