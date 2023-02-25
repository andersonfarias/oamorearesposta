class CreateAlcohols < ActiveRecord::Migration[4.2]
  def change
    create_table :alcohols do |t|
      t.string :tomar_alcool_durante_a_gravidez
      t.string :tomar_alcool_de_ma_qualidade
      t.string :trabalha_em_negocios_que_pedem_ou_exigem_o_consumo_de_licor
      t.string :mistura_o_consumo_de_alcool_com_outras_spa_ilicitas
      t.string :passar_de_uso_oral_para_outras_vias_nariz_intravenanosa_vagina
      t.string :uso_de_alcool
      t.string :nao_controlar_a_qualidade_da_substancia
      t.string :usar_simultaneamente_tipos_diferentes_de_alcool
      t.string :misturar_drogas_medicamentosa_com_o_consumo_de_alcool
      t.string :embriagar_se_sozinho
      t.string :tomar_grandes_quantidades_de_alcool
      t.string :tomar_alcool_de_fardos_contaminados_ou_sujos
      t.string :embriagar_se_em_grupo
      t.string :misturar_alcool_de_96_com_bebidas_a_gas

      t.timestamps null: false
    end
  end
end
