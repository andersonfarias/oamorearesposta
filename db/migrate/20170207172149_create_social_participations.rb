class CreateSocialParticipations < ActiveRecord::Migration[4.2]
  def change
    create_table :social_participations do |t|
      t.string :recebeu_ajuda_para_participar_de_grupos_e_associacoes
      t.string :educacao_em_direitos_humanos_e_sociais

      t.timestamps null: false
    end
  end
end
