class GroupLife < ApplicationRecord
	has_one :dependent_variable

	def self.init
		GroupLife.new(
			endividamento_com_o_vendedor_de_drogas: "0",
			ser_membro_de_grupo_composto_de_pessoas_de_alto_risco: "0",
			participar_de_grupo_com_atividades_criminosas: "0",
			ter_amigos_que_consomem_qualquer_tipo_de_droga: "0",
			ter_relacoes_afetivas_com_o_vendedor_de_drogas: "0",
			ter_perdido_amigos_por_causa_do_consumo_de_spa: "0",
			estar_sozinho: "0",
			ter_vinculos_com_grupos_ou_pessoas_à_margem_da_lei: "0",
			ter_relacoes_conflitivas_com_as_pessoas_com_as_quais_vive: "0",
			ser_vitima_de_discriminacao_pelo_grupo_com_o_qual_vive: "0",
			nao_usar_drogas_intravena_udi_e_viver_com_pessoa_que_utilizador: "0")
	end
end
