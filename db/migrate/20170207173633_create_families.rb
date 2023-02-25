class CreateFamilies < ActiveRecord::Migration[4.2]
  def change
    create_table :families do |t|
      t.string :familia_com_condutas_de_codependencia_
      t.string :nao_ter_vinculos_familiares_ou_afetivos
      t.string :ter_vinculos_familiares_de_alto_conflito_ou_risco
      t.string :foi_expulso_de_sua_familia
      t.string :vive_eventos_de_violencia_intrafamiliar
      t.string :em_sua_familia_ha_pessoas_dependentes_de_drogas_e_alcool
      t.string :familia_desintegrada
      t.string :ter_abandonado_sua_familia
      t.string :a_familia_pratica_a_exploracao_sexual
      t.string :utilizador_de_drogras_ud_ou_udi_que_coloca_em_risco_sua_familia
      t.string :ter_algum_familiar_que_produz_vende_comercializa_droga
      t.string :familia_em_condicoes_de_extrema_pobreza

      t.timestamps null: false
    end
  end
end
