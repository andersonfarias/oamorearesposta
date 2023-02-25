class UsedTechnique < ApplicationRecord
	has_one :independent_variable

	def self.init
		UsedTechnique.new(
			aconselhamento_e_orientacao_individual: "0",
			psicoterapia_individual: "0",
			visitas_familiares: "0",
			participacao_em_grupos_de_discucao: "0",
			terapia_de_grupo: "0",
			terapia_familiar: "0",
			terapia_de_rede: "0",
			grupo_de_autoajuda: "0",
			trabalhou_na_organizacao_como_forma_de_tratamento: "0",
			trabalhou_como_operador_para_a_organizacao: "0")
	end
end
