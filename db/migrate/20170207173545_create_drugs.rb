class CreateDrugs < ActiveRecord::Migration[4.2]
  def change
    create_table :drugs do |t|
      t.string :cometer_crimes_para_consumir
      t.string :usar_simultaneamente_varios_tipos_de_drogas
      t.string :usar_agulhas_nao_esterilizadas
      t.string :traficar_drogas_como_forma_de_comercio
      t.string :traficar_drogas_para_sustentar_o_uso_pessoal
      t.string :nao_controlar_a_qualidade_da_substancia
      t.string :passar_o_tempo_em_lugares_onde_se_vende_e_consome_drogas
      t.string :prostituir_se_para_comprar_droga
      t.string :consumir_drogas
      t.string :uso_intramuscular_ou_por_intravena
      t.string :consumir_novas_drogas
      t.string :droga_se_sozinho
      t.string :troca_de_vendedor
      t.string :droga_se_em_lugares_nao_seguros
      t.string :compartilhar_seringas
      t.string :usa_cannabis_haxixe_hongos_peiote_datura

      t.timestamps null: false
    end
  end
end
