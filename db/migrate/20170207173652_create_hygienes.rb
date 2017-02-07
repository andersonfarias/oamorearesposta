class CreateHygienes < ActiveRecord::Migration
  def change
    create_table :hygienes do |t|
      t.string :trocar_de_roupa_menos_de_uma_vez_por_semana
      t.string :tomar_banho_menos_de_uma_vez_por_semana
      t.string :nao_ter_um_lugar_para_tomar_banho
      t.string :nao_ter_roupa_limpa
      t.string :nao_cuidar_da_limpeza_de_seu_espaco_moradia
      t.string :lavar_sua_roupa_menos_de_uma_vez_por_semana

      t.timestamps null: false
    end
  end
end
