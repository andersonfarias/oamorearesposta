class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :oficinas_para_capacitacao_profissional
      t.string :realizou_uma_pratica_de_trabalho
      t.string :recebeu_ajuda_para_encontrar_trabalho

      t.timestamps null: false
    end
  end
end
