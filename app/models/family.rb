class Family < ActiveRecord::Base
	has_one :dependent_variable

	def self.init
		Family.new(
			familia_com_condutas_de_codependencia_: "0",
			nao_ter_vinculos_familiares_ou_afetivos: "0",
			ter_vinculos_familiares_de_alto_conflito_ou_risco: "0",
			foi_expulso_de_sua_familia: "0",
			vive_eventos_de_violencia_intrafamiliar: "0",
			em_sua_familia_ha_pessoas_dependentes_de_drogas_e_alcool: "0",
			familia_desintegrada: "0",
			ter_abandonado_sua_familia: "0",
			a_familia_pratica_a_exploracao_sexual: "0",
			utilizador_de_drogras_ud_ou_udi_que_coloca_em_risco_sua_familia: "0",
			ter_algum_familiar_que_produz_vende_comercializa_droga: "0",
			familia_em_condicoes_de_extrema_pobreza: "0")
	end
end
