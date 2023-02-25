class CreateProblemsDuringProcesses < ActiveRecord::Migration[4.2]
  def change
    create_table :problems_during_processes do |t|
      t.string :sustancias_alcool
      t.string :condutas_antissociais
      t.string :psiquiatricas
      t.string :comportamentais
      t.string :relacionais
      t.string :violencia_intrafamiliar
      t.string :violacao_abuso_sexual_adultos
      t.string :trabalho_sexual
      t.string :legal
      t.string :gravidez_parto
      t.string :doencas
      t.string :pobreza_extrema
      t.string :vida_na_rua
      t.string :apoio_econômico
      t.string :escolares
      t.string :exclusao_grave
      t.string :violencia_intracomunitaria
      t.string :redes_interinstitucionais
      t.string :crises_psicologicas
      t.string :capacitacao_e_formacao
      t.string :organizacao_e_planejamento
      t.string :hiv
      t.string :enfermidades_por_transmissao_sexual
      t.string :trafico_de_pessoas
      t.string :sem_trabalho
      t.string :tuberculose
      t.string :problemas_familiares
      t.string :transtorno_de_estres_pos_traumatico
      t.string :analfabetismo
      t.string :problemas_sexuais
      t.string :violacao_abuso_de_criancas
      t.string :outras_dependencias
      t.string :uso_de_drogas_intravenosa
      t.string :hepatites
      t.string :deslocacao_forcada
      t.string :migracao_ou_imigracao
      t.string :estigma_por_sua_identidade_sexual

      t.timestamps null: false
    end
  end
end
