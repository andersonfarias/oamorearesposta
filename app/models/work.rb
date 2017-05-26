class Work < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Work.new(
			oficinas_para_capacitacao_profissional: "0",
			realizou_uma_pratica_de_trabalho: "0",
			recebeu_ajuda_para_encontrar_trabalho: "0")
	end
end
