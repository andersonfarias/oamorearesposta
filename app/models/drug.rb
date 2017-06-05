class Drug < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		Drug.new(
			cometer_crimes_para_consumir: "0",
			usar_simultaneamente_varios_tipos_de_drogas: "0",
			usar_agulhas_nao_esterilizadas: "0",
			traficar_drogas_como_forma_de_comercio: "0",
			traficar_drogas_para_sustentar_o_uso_pessoal: "0",
			nao_controlar_a_qualidade_da_substancia: "0",
			passar_o_tempo_em_lugares_onde_se_vende_e_consome_drogas: "0",
			prostituir_se_para_comprar_droga: "0",
			consumir_drogas: "0",
			consumir_alcool: "0",
			uso_intramuscular_ou_por_intravena: "0",
			consumir_novas_drogas: "0",
			droga_se_sozinho: "0",
			troca_de_vendedor: "0",
			droga_se_em_lugares_nao_seguros: "0",
			compartilhar_seringas: "0",
			usa_cannabis_haxixe_hongos_peiote_datura: "0",
			usar_drogas_pesadas: "0",
			misturar_medicamentos: "0")
	end
end
