class SelfSecurity < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		SelfSecurity.new(
			tem_inimigos: "0",
			viver_em_comunidades_de_alto_risco: "0",
			realizar_atividades_ilegais: "0",
			andar_armado: "0",
			ter_condutas_violentas_frente_aos_outros: "0",
			pertencer_a_grupos_organizados_de_alto_risco: "0",
			nao_ter_um_grupo_de_referencia_estar_sozinho: "0",
			trabalhar_como_operador_de_rua: "0",
			nao_ter_vinculacao_com_instancias_licitas_e_legais: "0")
	end
end
