class CreateGroupLives < ActiveRecord::Migration
  def change
    create_table :group_lives do |t|
      t.string :endividamento_com_o_vendedor_de_drogas
      t.string :ser_membro_de_grupo_composto_de_pessoas_de_alto_risco
      t.string :participar_de_grupo_com_atividades_criminosas
      t.string :ter_amigos_que_consomem_qualquer_tipo_de_droga
      t.string :ter_relacoes_afetivas_com_o_vendedor_de_drogas
      t.string :ter_perdido_amigos_por_causa_do_consumo_de_spa
      t.string :estar_sozinho
      t.string :ter_vinculos_com_grupos_ou_pessoas_à_margem_da_lei
      t.string :ter_relacoes_conflitivas_com_as_pessoas_com_as_quais_vive
      t.string :ser_vitima_de_discriminacao_pelo_grupo_com_o_qual_vive
      t.string :nao_usar_drogas_intravena_udi_e_viver_com_pessoa_que_utilizador

      t.timestamps null: false
    end
  end
end
