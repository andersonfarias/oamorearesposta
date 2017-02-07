class CreateDependentEducations < ActiveRecord::Migration
  def change
    create_table :dependent_educations do |t|
      t.string :nao_tem_recursos_financeiros_para_estudar
      t.string :se_encontra_em_contextos_escolares_negativos
      t.string :ausenta_se_da_escola_capacitacao
      t.string :nao_tem_capacitacao_tecnica_e_ou_profissional
      t.string :nao_tem_ocupacao_ou_habilidades_produtivas
      t.string :tem_problemas_de_aprendizagem
      t.string :nao_completou_escola_secundaria
      t.string :nao_compretou_a_escola_primaria
      t.string :nao_saber_ler
      t.string :nao_sabe_escrever
      t.string :nao_sabe_fazer_calculos_basicos

      t.timestamps null: false
    end
  end
end
