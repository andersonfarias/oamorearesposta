class EvaluationsController < ApplicationController
	before_filter :set_evaluation

	def index
		@evaluations = Evaluation.search_result(params).paginate( :page => params[ :page ] )
	end

	def new
		@evaluation = Evaluation.new(
			evaluation_date: Date.today,
			organization_code: "AMRBR",
			beneficiary: Beneficiary.find(params[:beneficiary_id]),
			problems_during_process: ProblemsDuringProcess.new,
			independent_variable: IndependentVariable.new(
				albergue: Albergue.new,
				assistance_activity: AssistanceActivity.new,
				health: Health.new,
				community_treatment: CommunityTreatment.new,
				diagnosis_and_case_evaluation: DiagnosisAndCaseEvaluation.new,
				education: Education.new,
				guidelines_reference: GuidelinesReference.new,
				involved_structure: InvolvedStructure.new,
				social_participation: SocialParticipation.new,
				used_technique: UsedTechnique.new,
				work: Work.new),
			dependent_variable: DependentVariable.new(
				dependent_education: DependentEducation.new,
				drug: Drug.new,
				job: Job.new,
				sexual_life: SexualLife.new,
				self_security: SelfSecurity.new,
				dependent_health: DependentHealth.new,
				group_life: GroupLife.new,
				family: Family.new,
				alcohol: Alcohol.new,
				legality: Legality.new,
				home: Home.new,
				hygiene: Hygiene.new,
				feeding: Feeding.new,
				psychological_situation: PsychologicalSituation.new)
		)
	end

	def create
		@evaluation = Evaluation.new(evaluation_params)
		if @evaluation.save
			redirect_to @evaluation,
				notice: t('controllers.actions.create.success', model: Evaluation.model_name.human(count: 1))
		else
			render 'new', notice: @evaluation.errors
		end
	end

	def show
	end

	def edit
	end

	def destroy
        @evaluation.is_active = false
        if @evaluation.save()
            redirect_to evaluations_path,
                        notice: t('controllers.actions.destroy.success', model: Evaluation.model_name.human(count: 1))
        end
    end

	private
	def set_evaluation
		@evaluation = Evaluation.find(params[:id]) if params[:id]
	end

	def evaluation_params
        params.require(:evaluation).permit(
        	:user_id,
        	:beneficiary_id,
        	:organization_code,
        	:evaluation_date,
        	:number,
        	:concluded_process,
        	:suspensions,
        	:developing_process,
        	:problems_during_process_attributes => [
        		:sustancias_alcool, :condutas_antissociais, :psiquiatricas, :comportamentais, :relacionais, :violencia_intrafamiliar, :violacao_abuso_sexual_adultos, :trabalho_sexual, :legal, :gravidez_parto, :doencas, :pobreza_extrema, :vida_na_rua, :apoio_econômico, :escolares, :exclusao_grave, :violencia_intracomunitaria, :redes_interinstitucionais, :crises_psicologicas, :capacitacao_e_formacao, :organizacao_e_planejamento, :hiv, :enfermidades_por_transmissao_sexual, :trafico_de_pessoas, :sem_trabalho, :tuberculose, :problemas_familiares, :transtorno_de_estres_pos_traumatico, :analfabetismo, :problemas_sexuais, :violacao_abuso_de_criancas, :outras_dependencias, :uso_de_drogas_intravenosa, :hepatites, :deslocacao_forcada, :migracao_ou_imigracao, :estigma_por_sua_identidade_sexual],
 			:independent_variable_attributes => [
 				:assistance_activity_attributes => [:foi_ministrado_medicamentos, :foram_tratadas_as_feridas, :foi_realizado_diagnosticos, :foi_trocada_as_seringas, :foi_distribuido_preservativos, :foi_dado_medicamentos_para_hiv, :foi_dado_medicamentos_para_dst, :foi_realizado_teste_clinico_para_hiv, :foi_realizado_teste_clinico_para_dst, :foi_realizado_teste_clinico_para_tb, :foi_ministrado_medicamentos_para_tb, :foi_realizado_tratamentos_substitutivos],
 				:albergue_attributes => [:recebeu_acolhida_durante_a_noite, :recebeu_acolhida_durante_o_dia, :a_pessoa_teve_acesso_a_um_chuveiro, :a_pessoa_recebeu_produtos_para_banho, :a_pessoa_teve_acesso_ao_banheiro, :a_pessoa_recebeu_roupa_limpa, :a_pessoa_pode_lavar_sua_roupa, :a_pessoa_recebeu_comida_cafe_cha_biscoitos_etc, :a_pessoa_recebeu_alimentaco_completa, :a_pessoa_recebeu_apoio_financeiro_para_algum_servico, :a_pessoa_recebeu_alguma_bolsa_de_estudo, :foi_ajudada_em_momentos_de_perigo, :apoio_para_o_parto, :transporte, :proteco_para_os_filhos_as, :defesa_legal, :fianca_para_sair_da_priso, :documentaco],
				:health_attributes => [:sobre_hiv, :sobre_sexo_seguro_, :sobre_uso_seguro_de_drogas, :sobre_doencas_transmitidas_por_via_sanguinea_e_sexual, :primeros_socorros],
				:education_attributes => [:oficinas_ou_cursos_de_alfabetizacao, :apoio_para_recuperacao_escolar, :recebeu_ajuda_para_se_inserir_em_uma_escola, :recebeu_uma_bolsa_de_estudos, :foi_inserida_em_uma_escola_formal],
				:work_attributes => [:oficinas_para_capacitacao_profissional, :realizou_uma_pratica_de_trabalho, :recebeu_ajuda_para_encontrar_trabalho],
				:social_participation_attributes => [:recebeu_ajuda_para_participar_de_grupos_e_associacoes, :educacao_em_direitos_humanos_e_sociais],
				:guidelines_reference_attributes => [:foi_orientado_informado_ou_encaminhado_para_uma_escola, :a_gesteo_da_iniciativa_e_feita_em_conjunto, :esta_iniciativa_foi_avaliada_em_conjunto_01, :orientacao_indicacao_encaminhamento_para_uma_oficina, :esta_iniciativa_e_implementada_conjuntamente_01, :esta_iniciativa_foi_avaliada_em_conjunto_02, :orientacao_referente_a_uma_agencia_de_tratamento, :a_gestao_da_iniciativa_e_feita_em_conjunto_01, :esta_iniciativa_foi_avaliada_em_conjunto_03, :orientacao_referente_a_uma_agencia_de_tratamento_nao_registrada, :a_gestao_da_iniciativa_e_feita_em_conjunto_02, :esta_iniciativa_foi_avaliada_em_conjunto_04, :a_pessoa_recebeu_orientacao_para_uma_possibilidade_de_trabalho, :a_gestao_da_iniciativa_e_feita_em_conjunto_03, :esta_iniciativa_foi_avaliada_em_conjunto_05, :orientacao_sobre_um_hospital_ou_um_serviço_medico, :esta_iniciativa_e_implementada_conjuntamente_02, :esta_iniciativa_foi_avaliada_em_conjunto_06, :orientacoes_sobre_atividades_grupos_participacao_sociocultural, :esta_iniciativa_e_implementada_conjuntamente_003, :esta_iniciativa_foi_avaliada_em_conjunto_07],
				:community_treatment_attributes => [:a_equipe_foi_envolvida, :a_rede_subjetiva_comunitaria_foi_envolvida, :a_rede_operativa_foi_envolvida, :a_rede_de_recursos_comunitarios_foi_envolvida, :a_rede_de_lideres_de_opiniao_foi_envolvida, :a_rede_subjetiva_do_parceiro_foi_envolvida],
				:diagnosis_and_case_evaluation_attributes => [:foi_realizado_um_diagnostico_individual, :foi_realizado_um_diagnostico_familiar, :foi_realizado_um_diagnostico_de_rede, :existe_uma_hpc_ficha_de_primeiro_contato, :existe_uma_spicl_seguimento_de_processos_em_comunidade_locais, :foi_realizada_uma_avaliacao_da_demanda, :foi_realizada_uma_avaliacao_dos_recursos_da_pessoa, :foi_realiazada_uma_avaliacao_dos_recursos_da_rede_subjetiva, :o_processo_de_tratamento_foi_programado_em_equipe, :o_processo_de_tratamento_foi_programa_pela_rede_operativa, :foram_definidos_os_objetivos_e_metas, :objetivos_e_metas_foram_avaliados, :foi_realizada_uma_avaliacao_formal, :o_processo_global_foi_avaliado_em_equipe, :o_processo_foi_concluido, :o_processo_foi_interrompido, :a_pessoa_faleceu],
				:involved_structure_attributes => [:territorios_comunitarios, :ha_bens_e_serviços_na_comunidade_tidos_como_naturais, :recursos_oferecidos_pelos_atores_tidos_como_privados, :centros_de_baixa_de_exigencia_e_baixa_complexidade, :centros_de_baixa_de_exigencia_e_media_complexidade, :centros_de_baixa_de_exigencia_e_alta_complexidade],
				:used_technique_attributes => [:aconselhamento_e_orientacao_individual, :psicoterapia_individual, :visitas_familiares, :participacao_em_grupos_de_discucao, :terapia_de_grupo, :terapia_familiar, :terapia_de_rede, :grupo_de_autoajuda, :trabalhou_na_organizacao_como_forma_de_tratamento, :trabalhou_como_operador_para_a_organizacao]
			],
			:dependent_variable_attributes => [
				:dependent_education_attributes => [:nao_tem_recursos_financeiros_para_estudar, :se_encontra_em_contextos_escolares_negativos, :ausenta_se_da_escola_capacitacao, :nao_tem_capacitacao_tecnica_e_ou_profissional, :nao_tem_ocupacao_ou_habilidades_produtivas, :tem_problemas_de_aprendizagem, :nao_completou_escola_secundaria, :nao_compretou_a_escola_primaria, :nao_saber_ler, :nao_sabe_escrever, :nao_sabe_fazer_calculos_basicos], 
				:drug_attributes => [:cometer_crimes_para_consumir, :usar_simultaneamente_varios_tipos_de_drogas, :usar_agulhas_nao_esterilizadas, :traficar_drogas_como_forma_de_comercio, :traficar_drogas_para_sustentar_o_uso_pessoal, :nao_controlar_a_qualidade_da_substancia, :passar_o_tempo_em_lugares_onde_se_vende_e_consome_drogas, :prostituir_se_para_comprar_droga, :consumir_drogas, :uso_intramuscular_ou_por_intravena, :consumir_novas_drogas, :droga_se_sozinho, :troca_de_vendedor, :droga_se_em_lugares_nao_seguros, :compartilhar_seringas, :usa_cannabis_haxixe_hongos_peiote_datura], :job_attributes => [:ter_ocupacao_ilegal, :estar_sem_trabalho_ou_sem_ocupacao, :trabalhar_em_lugares_que_promove_ou_exigem_o_consumo_de_drogas, :ter_ocupacao_de_alto_risco_relacionado_a_drogas_ou_seguranca, :ter_um_trabalho_no_qual_ha_exploracao_grave_de_mao_de_obra, :vive_em_um_contexto_onde_nao_ha_oportunidades_de_trabalho], 
				:sexual_life_attributes => [:nao_utiliza_preservativos, :ter_relacoes_sexuais_com_companheiros_perigosos_, :ter_relacoes_sexuais_sob_efeito_de_droga_intoxicado_etc, :ter_relacoes_sexuais_de_maneira_desprotegida_com_o_a_parceiro_a, :ter_relacoes_sexuais_em_lugares_de_alto_risco, :iniciar_a_vida_sexual_precocemente_sem_infomacoes, :nao_tomar_em_conta_periodo_latente_nos_testes_clinicos_para_hiv, :nao_fazer_testes_medicos_periodicos, :nao_fazer_teste_clinico_apos_relacao_sexual_sem_preservativo], :self_security_attributes => [:tem_inimigos, :viver_em_comunidades_de_alto_risco, :realizar_atividades_ilegais, :andar_armado, :ter_condutas_violentas_frente_aos_outros, :pertencer_a_grupos_organizados_de_alto_risco, :nao_ter_um_grupo_de_referencia_estar_sozinho, :trabalhar_como_operador_de_rua, :nao_ter_vinculacao_com_instancias_licitas_e_legais], 
				:dependent_health_attributes => [:vive_com_hiv_e_tem_relacoes_sexuais_sem_protecao, :nao_tem_direito_a_medicamentos_vitais, :tem_sida_hiv, :e_hiv_positivo, :tem_hepatite, :consumir_drogas_durante_a_gravidez, :ter_uma_gravidez_em_situacao_de_risco, :tem_dst_ets_std, :não_tem_acesso_a_servicos_medicos_basicos, :praticar_construcoes_corporais_sem_condicoes_medicas_adequadas, :ter_doencas_e_nao_se_tratar, :ter_passado_por_aborto_mal_feito, :tem_tuberculose, :gravidez_indesejada], 
				:group_life_attributes => [:endividamento_com_o_vendedor_de_drogas, :ser_membro_de_grupo_composto_de_pessoas_de_alto_risco, :participar_de_grupo_com_atividades_criminosas, :ter_amigos_que_consomem_qualquer_tipo_de_droga, :ter_relacoes_afetivas_com_o_vendedor_de_drogas, :ter_perdido_amigos_por_causa_do_consumo_de_spa, :estar_sozinho, :ter_vinculos_com_grupos_ou_pessoas_à_margem_da_lei, :ter_relacoes_conflitivas_com_as_pessoas_com_as_quais_vive, :ser_vitima_de_discriminacao_pelo_grupo_com_o_qual_vive, :nao_usar_drogas_intravena_udi_e_viver_com_pessoa_que_utilizador], 
				:family_attributes => [:familia_com_condutas_de_codependencia_, :nao_ter_vinculos_familiares_ou_afetivos, :ter_vinculos_familiares_de_alto_conflito_ou_risco, :foi_expulso_de_sua_familia, :vive_eventos_de_violencia_intrafamiliar, :em_sua_familia_ha_pessoas_dependentes_de_drogas_e_alcool, :familia_desintegrada, :ter_abandonado_sua_familia, :a_familia_pratica_a_exploracao_sexual, :utilizador_de_drogras_ud_ou_udi_que_coloca_em_risco_sua_familia, :ter_algum_familiar_que_produz_vende_comercializa_droga, :familia_em_condicoes_de_extrema_pobreza], 
				:alcohol_attributes => [:tomar_alcool_durante_a_gravidez, :tomar_alcool_de_ma_qualidade, :trabalha_em_negocios_que_pedem_ou_exigem_o_consumo_de_licor, :mistura_o_consumo_de_alcool_com_outras_spa_ilicitas, :passar_de_uso_oral_para_outras_vias_nariz_intravenanosa_vagina, :uso_de_alcool, :nao_controlar_a_qualidade_da_substancia, :usar_simultaneamente_tipos_diferentes_de_alcool, :misturar_drogas_medicamentosa_com_o_consumo_de_alcool, :embriagar_se_sozinho, :tomar_grandes_quantidades_de_alcool, :tomar_alcool_de_fardos_contaminados_ou_sujos, :embriagar_se_em_grupo, :misturar_alcool_de_96_com_bebidas_a_gas], 
				:legality_attributes => [:cometer_roubos, :cometer_assaltos, :traficar_drogas, :pertencer_a_grupos_criminosos_e_quadrilhas, :estar_na_prisao, :participar_em_acoes_criminosas, :consumir_drogas_em_lugares_publicos, :ter_documentos_falsos, :portar_armas_sem_salvo_conduto_e_armas_brancas, :manter_se_com_dinheiro_e_produtos_de_atividades_criminosas, :ter_estado_privado_de_liberdade, :estar_sem_documentos_legais_de_imigrante, :nao_ter_documentos_de_identidade, :cometer_homicidios_ou_produzir_lesoes_a_outrem, :ser_fugitivo_da_justica_ou_reu_ausente], 
				:home_attributes => [:viver_em_espacos_publicos_em_mas_condicoes, :viver_com_pessoas_de_alto_risco, :viver_em_lugares_de_consumo, :viver_em_lugares_sem_higiene_nem_servicos_basicos, :moradia_precaria, :viver_em_estruturas_semelhantes_ao_cortico, :viver_em_zonas_com_presenca_de_grupos_armados_a_margem_da_lei, :vivir_en_superlotacao, :viver_em_uma_comunidade_de_alto_risco], 
				:hygiene_attributes => [:trocar_de_roupa_menos_de_uma_vez_por_semana, :tomar_banho_menos_de_uma_vez_por_semana, :nao_ter_um_lugar_para_tomar_banho, :nao_ter_roupa_limpa, :nao_cuidar_da_limpeza_de_seu_espaco_moradia, :lavar_sua_roupa_menos_de_uma_vez_por_semana],
				:feeding_attributes => [:alimentar_se_menos_de_uma_vez_ao_dia, :alimentar_se_na_rua_sem_controle_higienico, :ficar_dias_sem_se_alimentar, :tirar_sua_alimentacao_do_lixo],
				:psychological_situation_attributes => [:viver_uma_depressao, :viver_experiencias_psicoticas, :viver_transtornos_de_limites_de_personalidade, :viver_situacao_de_panico, :transtorno_de_ansiedade, :personalidade_antissocial, :alteracoes_graves_do_humor_devido_ao_abuso_de_substancias, :somatizar_situacoes_de_estres_ou_conflito, :viver_situacoes_de_luto, :transtorno_por_estres_pos_traumatico, :troca_de_conduta_depois_de_ter_sido_vitima_de_violencia, :teve_pensamentos_de_suicidio, :tentou_suicidio, :lhe_foi_receitado_algum_medicamento_por_problema_psicologico]
			])

    end
end