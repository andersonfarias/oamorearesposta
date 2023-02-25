class CreateSelfSecurities < ActiveRecord::Migration[4.2]
  def change
    create_table :self_securities do |t|
      t.string :tem_inimigos
      t.string :viver_em_comunidades_de_alto_risco
      t.string :realizar_atividades_ilegais
      t.string :andar_armado
      t.string :ter_condutas_violentas_frente_aos_outros
      t.string :pertencer_a_grupos_organizados_de_alto_risco
      t.string :nao_ter_um_grupo_de_referencia_estar_sozinho
      t.string :trabalhar_como_operador_de_rua
      t.string :nao_ter_vinculacao_com_instancias_licitas_e_legais

      t.timestamps null: false
    end
  end
end
