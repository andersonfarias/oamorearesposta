class CreateDiagnosisAndCaseEvaluations < ActiveRecord::Migration
  def change
    create_table :diagnosis_and_case_evaluations do |t|
      t.string :foi_realizado_um_diagnostico_individual
      t.string :foi_realizado_um_diagnostico_familiar
      t.string :foi_realizado_um_diagnostico_de_rede
      t.string :existe_uma_hpc_ficha_de_primeiro_contato
      t.string :existe_uma_spicl_seguimento_de_processos_em_comunidade_locais
      t.string :foi_realizada_uma_avaliacao_da_demanda
      t.string :foi_realizada_uma_avaliacao_dos_recursos_da_pessoa
      t.string :foi_realiazada_uma_avaliacao_dos_recursos_da_rede_subjetiva_da_pessoa
      t.string :o_processo_de_tratamento_foi_programado_em_equipe
      t.string :o_processo_de_tratamento_foi_programa_pela_rede_operativa
      t.string :foram_definidos_os_objetivos_e_metas
      t.string :objetivos_e_metas_foram_avaliados
      t.string :foi_realizada_uma_avaliacao_formal
      t.string :o_processo_global_foi_avaliado_em_equipe
      t.string :o_processo_foi_concluido
      t.string :o_processo_foi_interrompido
      t.string :a_pessoa_faleceu

      t.timestamps null: false
    end
  end
end
