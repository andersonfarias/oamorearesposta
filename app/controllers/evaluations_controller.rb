class EvaluationsController < ApplicationController
	before_filter :set_evaluation

	def index
		@evaluations = Evaluation.search_result(params).paginate( :page => params[ :page ] )
	end

	def new
		@evaluation = Evaluation.new(
			evaluation_date: Date.today,
			organization_code: "AMRBR",
			concluded_process: false,
			developing_process: true,
			suspensions: false,
			beneficiary: Beneficiary.find(params[:beneficiary_id]),
			problems_during_process: ProblemsDuringProcess.init,
			independent_variable: IndependentVariable.new(
				axis1: Axis1.init,
				axis2: Axis2.init,
				axis3: Axis3.init,
				axis4: Axis4.init,
				axis5: Axis5.init),
			dependent_variable: DependentVariable.new(
				dependent_education: DependentEducation.init,
				drug: Drug.init,
				job: Job.init,
				self_security: SelfSecurity.init,
				dependent_health: DependentHealth.init,
				main_network: MainNetwork.init,
				basic_assistance: BasicAssistance.init)
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
		respond_to do |format|
			format.html
			format.xls
 		end
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
 				:axis1_attributes => [:i_3_1_1, :i_3_1_2, :i_3_1_3, :i_3_1_4],
 				:axis2_attributes => [:i_3_2_1, :i_3_2_2, :i_3_2_3, :i_3_2_4],
				:axis3_attributes => [:i_3_3_1, :i_3_3_2, :i_3_3_3, :i_3_3_4],
				:axis4_attributes => [:i_3_4_1, :i_3_4_2, :i_3_4_3, :i_3_4_4, :i_3_4_5, :i_3_4_6, :i_3_4_7, :i_3_4_8, :i_3_4_9],
				:axis5_attributes => [:i_3_5_1, :i_3_5_2, :i_3_5_3, :i_3_5_4, :i_3_5_5]
			],
			:dependent_variable_attributes => [
				:dependent_education_attributes => [:nao_tem_recursos_financeiros_para_estudar, :se_encontra_em_contextos_escolares_negativos, :ausenta_se_da_escola_capacitacao, :nao_tem_capacitacao_tecnica_e_ou_profissional, :nao_tem_ocupacao_ou_habilidades_produtivas, :tem_problemas_de_aprendizagem, :nao_completou_escola_secundaria, :nao_compretou_a_escola_primaria, :nao_saber_ler, :nao_sabe_escrever, :nao_sabe_fazer_calculos_basicos], 
				:drug_attributes => [:cometer_crimes_para_consumir, :usar_simultaneamente_varios_tipos_de_drogas, :usar_agulhas_nao_esterilizadas, :traficar_drogas_como_forma_de_comercio, :traficar_drogas_para_sustentar_o_uso_pessoal, :nao_controlar_a_qualidade_da_substancia, :passar_o_tempo_em_lugares_onde_se_vende_e_consome_drogas, :prostituir_se_para_comprar_droga, :consumir_drogas, :uso_intramuscular_ou_por_intravena, :consumir_novas_drogas, :droga_se_sozinho, :troca_de_vendedor, :droga_se_em_lugares_nao_seguros, :compartilhar_seringas, :usa_cannabis_haxixe_hongos_peiote_datura], 
				:job_attributes => [:ter_ocupacao_ilegal, :estar_sem_trabalho_ou_sem_ocupacao, :trabalhar_em_lugares_que_promove_ou_exigem_o_consumo_de_drogas, :ter_ocupacao_de_alto_risco_relacionado_a_drogas_ou_seguranca, :ter_um_trabalho_no_qual_ha_exploracao_grave_de_mao_de_obra, :vive_em_um_contexto_onde_nao_ha_oportunidades_de_trabalho], 
				:self_security_attributes => [:tem_inimigos, :viver_em_comunidades_de_alto_risco, :realizar_atividades_ilegais, :andar_armado, :ter_condutas_violentas_frente_aos_outros, :pertencer_a_grupos_organizados_de_alto_risco, :nao_ter_um_grupo_de_referencia_estar_sozinho, :trabalhar_como_operador_de_rua, :nao_ter_vinculacao_com_instancias_licitas_e_legais],
				:dependent_health_attributes => [:vive_com_hiv_e_tem_relacoes_sexuais_sem_protecao, :nao_tem_direito_a_medicamentos_vitais, :tem_sida_hiv, :e_hiv_positivo, :tem_hepatite, :consumir_drogas_durante_a_gravidez, :ter_uma_gravidez_em_situacao_de_risco, :tem_dst_ets_std, :não_tem_acesso_a_servicos_medicos_basicos, :praticar_construcoes_corporais_sem_condicoes_medicas_adequadas, :ter_doencas_e_nao_se_tratar, :ter_passado_por_aborto_mal_feito, :tem_tuberculose, :gravidez_indesejada],
				:main_network_attributes => [:i_9_1, :i_9_2, :i_9_3, :i_9_4, :i_9_5, :i_9_6, :i_9_7, :i_9_8, :i_9_9, :i_9_10, :i_9_11, :i_9_12, :i_9_13, :i_9_14, :i_9_15, :i_9_16],
 				:basic_assistance_attributes => [:i_10_1, :i_10_2, :i_10_3, :i_10_4, :i_10_5, :i_10_6, :i_10_7, :i_10_8, :i_10_9, :i_10_10, :i_10_11, :i_10_12, :i_10_13, :i_10_14, :i_10_15]
			])

    end
end