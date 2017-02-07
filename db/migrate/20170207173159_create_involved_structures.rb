class CreateInvolvedStructures < ActiveRecord::Migration
  def change
    create_table :involved_structures do |t|
      t.string :territorios_comunitarios
      t.string :ha_bens_e_serviços_na_comunidade_tidos_como_naturais
      t.string :recursos_oferecidos_pelos_atores_tidos_como_privados
      t.string :centros_de_baixa_de_exigencia_e_baixa_complexidade
      t.string :centros_de_baixa_de_exigencia_e_media_complexidade
      t.string :centros_de_baixa_de_exigencia_e_alta_complexidade

      t.timestamps null: false
    end
  end
end
