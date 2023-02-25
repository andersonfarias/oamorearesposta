class Feeding < ApplicationRecord
	has_one :dependent_variable

	def self.init
		Feeding.new(
			alimentar_se_menos_de_uma_vez_ao_dia: "0",
			alimentar_se_na_rua_sem_controle_higienico: "0",
			ficar_dias_sem_se_alimentar: "0",
			tirar_sua_alimentacao_do_lixo: "0")
	end
end
