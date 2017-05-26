class Education < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Education.new(
			oficinas_ou_cursos_de_alfabetizacao: "0",
			apoio_para_recuperacao_escolar: "0",
			recebeu_ajuda_para_se_inserir_em_uma_escola: "0",
			recebeu_uma_bolsa_de_estudos: "0",
			foi_inserida_em_uma_escola_formal: "0")
	end
end
