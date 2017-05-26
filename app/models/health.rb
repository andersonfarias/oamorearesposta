class Health < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Health.new(
			sobre_hiv: "0",
			sobre_sexo_seguro_: "0",
			sobre_uso_seguro_de_drogas: "0",
			sobre_doencas_transmitidas_por_via_sanguinea_e_sexual: "0",
			primeros_socorros: "0")
	end

end
