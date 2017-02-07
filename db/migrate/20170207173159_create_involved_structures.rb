class CreateInvolvedStructures < ActiveRecord::Migration
  def change
    create_table :involved_structures do |t|
      t.integer :territorios_comunitarios
      t.integer :ha_bens_e_serviços_na_comunidade_tidos_como_naturais
      t.integer :recursos_oferecidos_pelos_atores_tidos_como_privados
      t.integer :centros_de_baixa_de_exigencia_e_baixa_complexidade
      t.integer :centros_de_baixa_de_exigencia_e_media_complexidade
      t.integer :centros_de_baixa_de_exigencia_e_alta_complexidade

      t.timestamps null: false
    end
  end
end
