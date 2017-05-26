class AssistanceActivity < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		AssistanceActivity.new(
			foi_ministrado_medicamentos: "0",
			foram_tratadas_as_feridas: "0",
			foi_realizado_diagnosticos: "0",
			foi_trocada_as_seringas: "0",
			foi_distribuido_preservativos: "0",
			foi_dado_medicamentos_para_hiv: "0",
			foi_dado_medicamentos_para_dst: "0",
			foi_realizado_teste_clinico_para_hiv: "0",
			foi_realizado_teste_clinico_para_dst: "0",
			foi_realizado_teste_clinico_para_tb: "0",
			foi_ministrado_medicamentos_para_tb: "0",
			foi_realizado_tratamentos_substitutivos: "0")
	end
end
