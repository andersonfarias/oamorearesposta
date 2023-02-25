class CreateEducations < ActiveRecord::Migration[4.2]
  def change
    create_table :educations do |t|
      t.string :oficinas_ou_cursos_de_alfabetizacao
      t.string :apoio_para_recuperacao_escolar
      t.string :recebeu_ajuda_para_se_inserir_em_uma_escola
      t.string :recebeu_uma_bolsa_de_estudos
      t.string :foi_inserida_em_uma_escola_formal

      t.timestamps null: false
    end
  end
end
