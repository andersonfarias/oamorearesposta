class CreateHealths < ActiveRecord::Migration[4.2]
  def change
    create_table :healths do |t|
      t.string :sobre_hiv
      t.string :sobre_sexo_seguro_
      t.string :sobre_uso_seguro_de_drogas
      t.string :sobre_doencas_transmitidas_por_via_sanguinea_e_sexual
      t.string :primeros_socorros

      t.timestamps null: false
    end
  end
end
