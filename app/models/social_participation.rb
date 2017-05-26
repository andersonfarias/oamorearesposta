class SocialParticipation < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		SocialParticipation.new(      
			recebeu_ajuda_para_participar_de_grupos_e_associacoes: "0",
      		educacao_em_direitos_humanos_e_sociais: "0")
	end
end
