class CreateUsedTechniques < ActiveRecord::Migration[4.2]
  def change
    create_table :used_techniques do |t|
      t.string :aconselhamento_e_orientacao_individual
      t.string :psicoterapia_individual
      t.string :visitas_familiares
      t.string :participacao_em_grupos_de_discucao
      t.string :terapia_de_grupo
      t.string :terapia_familiar
      t.string :terapia_de_rede
      t.string :grupo_de_autoajuda
      t.string :trabalhou_na_organizacao_como_forma_de_tratamento
      t.string :trabalhou_como_operador_para_a_organizacao

      t.timestamps null: false
    end
  end
end
