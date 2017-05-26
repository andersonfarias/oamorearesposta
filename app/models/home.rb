class Home < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		Home.new(viver_em_espacos_publicos_em_mas_condicoes: "0",
			viver_com_pessoas_de_alto_risco: "0",
			viver_em_lugares_de_consumo: "0",
			viver_em_lugares_sem_higiene_nem_servicos_basicos: "0",
			moradia_precaria: "0",
			viver_em_estruturas_semelhantes_ao_cortico: "0",
			viver_em_zonas_com_presenca_de_grupos_armados_a_margem_da_lei: "0",
			vivir_en_superlotacao: "0",
			viver_em_uma_comunidade_de_alto_risco: "0")
	end
end
