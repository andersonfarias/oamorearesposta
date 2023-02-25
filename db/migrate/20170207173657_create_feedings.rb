class CreateFeedings < ActiveRecord::Migration[4.2]
  def change
    create_table :feedings do |t|
      t.string :alimentar_se_menos_de_uma_vez_ao_dia
      t.string :alimentar_se_na_rua_sem_controle_higienico
      t.string :ficar_dias_sem_se_alimentar
      t.string :tirar_sua_alimentacao_do_lixo

      t.timestamps null: false
    end
  end
end
