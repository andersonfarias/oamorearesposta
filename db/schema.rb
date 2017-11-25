# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171125052509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "axis"
    t.integer  "department_id"
    t.boolean  "is_active",     default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "activities", ["department_id"], name: "index_activities_on_department_id", using: :btree

  create_table "activity_diaries", force: :cascade do |t|
    t.integer  "diary_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activity_diaries", ["activity_id"], name: "index_activity_diaries_on_activity_id", using: :btree
  add_index "activity_diaries", ["diary_id"], name: "index_activity_diaries_on_diary_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "neighborhood"
    t.string   "number"
    t.string   "cep"
    t.text     "complement"
    t.integer  "city_id"
    t.integer  "person_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["person_id"], name: "index_addresses_on_person_id", using: :btree

  create_table "albergues", force: :cascade do |t|
    t.string   "recebeu_acolhida_durante_a_noite"
    t.string   "recebeu_acolhida_durante_o_dia"
    t.string   "a_pessoa_teve_acesso_a_um_chuveiro"
    t.string   "a_pessoa_recebeu_produtos_para_banho"
    t.string   "a_pessoa_teve_acesso_ao_banheiro"
    t.string   "a_pessoa_recebeu_roupa_limpa"
    t.string   "a_pessoa_pode_lavar_sua_roupa"
    t.string   "a_pessoa_recebeu_comida_cafe_cha_biscoitos_etc"
    t.string   "a_pessoa_recebeu_alimentaco_completa"
    t.string   "a_pessoa_recebeu_apoio_financeiro_para_algum_servico"
    t.string   "a_pessoa_recebeu_alguma_bolsa_de_estudo"
    t.string   "foi_ajudada_em_momentos_de_perigo"
    t.string   "apoio_para_o_parto"
    t.string   "transporte"
    t.string   "proteco_para_os_filhos_as"
    t.string   "defesa_legal"
    t.string   "fianca_para_sair_da_priso"
    t.string   "documentaco"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "alcohols", force: :cascade do |t|
    t.string   "tomar_alcool_durante_a_gravidez"
    t.string   "tomar_alcool_de_ma_qualidade"
    t.string   "trabalha_em_negocios_que_pedem_ou_exigem_o_consumo_de_licor"
    t.string   "mistura_o_consumo_de_alcool_com_outras_spa_ilicitas"
    t.string   "passar_de_uso_oral_para_outras_vias_nariz_intravenanosa_vagina"
    t.string   "uso_de_alcool"
    t.string   "nao_controlar_a_qualidade_da_substancia"
    t.string   "usar_simultaneamente_tipos_diferentes_de_alcool"
    t.string   "misturar_drogas_medicamentosa_com_o_consumo_de_alcool"
    t.string   "embriagar_se_sozinho"
    t.string   "tomar_grandes_quantidades_de_alcool"
    t.string   "tomar_alcool_de_fardos_contaminados_ou_sujos"
    t.string   "embriagar_se_em_grupo"
    t.string   "misturar_alcool_de_96_com_bebidas_a_gas"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "assistance_activities", force: :cascade do |t|
    t.string   "foi_ministrado_medicamentos"
    t.string   "foram_tratadas_as_feridas"
    t.string   "foi_realizado_diagnosticos"
    t.string   "foi_trocada_as_seringas"
    t.string   "foi_distribuido_preservativos"
    t.string   "foi_dado_medicamentos_para_hiv"
    t.string   "foi_dado_medicamentos_para_dst"
    t.string   "foi_realizado_teste_clinico_para_hiv"
    t.string   "foi_realizado_teste_clinico_para_dst"
    t.string   "foi_realizado_teste_clinico_para_tb"
    t.string   "foi_ministrado_medicamentos_para_tb"
    t.string   "foi_realizado_tratamentos_substitutivos"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "activity_diary_id"
    t.integer  "beneficiary_id"
    t.text     "observation"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "attendances", ["activity_diary_id"], name: "index_attendances_on_activity_diary_id", using: :btree
  add_index "attendances", ["beneficiary_id"], name: "index_attendances_on_beneficiary_id", using: :btree

  create_table "axis1s", force: :cascade do |t|
    t.string   "i_3_1_1"
    t.string   "i_3_1_2"
    t.string   "i_3_1_3"
    t.string   "i_3_1_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis2s", force: :cascade do |t|
    t.string   "i_3_2_1"
    t.string   "i_3_2_2"
    t.string   "i_3_2_3"
    t.string   "i_3_2_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis3s", force: :cascade do |t|
    t.string   "i_3_3_1"
    t.string   "i_3_3_2"
    t.string   "i_3_3_3"
    t.string   "i_3_3_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis4s", force: :cascade do |t|
    t.string   "i_3_4_1"
    t.string   "i_3_4_2"
    t.string   "i_3_4_3"
    t.string   "i_3_4_4"
    t.string   "i_3_4_5"
    t.string   "i_3_4_6"
    t.string   "i_3_4_7"
    t.string   "i_3_4_8"
    t.string   "i_3_4_9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis5s", force: :cascade do |t|
    t.string   "i_3_5_1"
    t.string   "i_3_5_2"
    t.string   "i_3_5_3"
    t.string   "i_3_5_4"
    t.string   "i_3_5_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis_1s", force: :cascade do |t|
    t.string   "i_3_1_1"
    t.string   "i_3_1_2"
    t.string   "i_3_1_3"
    t.string   "i_3_1_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis_2s", force: :cascade do |t|
    t.string   "i_3_2_1"
    t.string   "i_3_2_2"
    t.string   "i_3_2_3"
    t.string   "i_3_2_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis_3s", force: :cascade do |t|
    t.string   "i_3_3_1"
    t.string   "i_3_3_2"
    t.string   "i_3_3_3"
    t.string   "i_3_3_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis_4s", force: :cascade do |t|
    t.string   "i_3_4_1"
    t.string   "i_3_4_2"
    t.string   "i_3_4_3"
    t.string   "i_3_4_4"
    t.string   "i_3_4_5"
    t.string   "i_3_4_6"
    t.string   "i_3_4_7"
    t.string   "i_3_4_8"
    t.string   "i_3_4_9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axis_5s", force: :cascade do |t|
    t.string   "i_3_5_1"
    t.string   "i_3_5_2"
    t.string   "i_3_5_3"
    t.string   "i_3_5_4"
    t.string   "i_3_5_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "basic_assistances", force: :cascade do |t|
    t.string   "i_10_1"
    t.string   "i_10_2"
    t.string   "i_10_3"
    t.string   "i_10_4"
    t.string   "i_10_5"
    t.string   "i_10_6"
    t.string   "i_10_7"
    t.string   "i_10_8"
    t.string   "i_10_9"
    t.string   "i_10_10"
    t.string   "i_10_11"
    t.string   "i_10_12"
    t.string   "i_10_13"
    t.string   "i_10_14"
    t.string   "i_10_15"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beneficiaries", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "person_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_active",     default: true
  end

  add_index "beneficiaries", ["department_id"], name: "index_beneficiaries_on_department_id", using: :btree
  add_index "beneficiaries", ["person_id"], name: "index_beneficiaries_on_person_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "citizens", force: :cascade do |t|
    t.boolean  "leader"
    t.string   "social_role"
    t.integer  "person_id"
    t.integer  "comunity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "citizens", ["comunity_id"], name: "index_citizens_on_comunity_id", using: :btree
  add_index "citizens", ["person_id"], name: "index_citizens_on_person_id", using: :btree

  create_table "community_treatments", force: :cascade do |t|
    t.string   "a_equipe_foi_envolvida"
    t.string   "a_rede_subjetiva_comunitaria_foi_envolvida"
    t.string   "a_rede_operativa_foi_envolvida"
    t.string   "a_rede_de_recursos_comunitarios_foi_envolvida"
    t.string   "a_rede_de_lideres_de_opiniao_foi_envolvida"
    t.string   "a_rede_subjetiva_do_parceiro_foi_envolvida"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "comunities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "generators_theme"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_active",   default: true
  end

  create_table "dependent_educations", force: :cascade do |t|
    t.string   "nao_tem_recursos_financeiros_para_estudar"
    t.string   "se_encontra_em_contextos_escolares_negativos"
    t.string   "ausenta_se_da_escola_capacitacao"
    t.string   "nao_tem_capacitacao_tecnica_e_ou_profissional"
    t.string   "nao_tem_ocupacao_ou_habilidades_produtivas"
    t.string   "tem_problemas_de_aprendizagem"
    t.string   "nao_completou_escola_secundaria"
    t.string   "nao_compretou_a_escola_primaria"
    t.string   "nao_saber_ler"
    t.string   "nao_sabe_escrever"
    t.string   "nao_sabe_fazer_calculos_basicos"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "dependent_healths", force: :cascade do |t|
    t.string   "vive_com_hiv_e_tem_relacoes_sexuais_sem_protecao"
    t.string   "nao_tem_direito_a_medicamentos_vitais"
    t.string   "tem_sida_hiv"
    t.string   "e_hiv_positivo"
    t.string   "tem_hepatite"
    t.string   "consumir_drogas_durante_a_gravidez"
    t.string   "ter_uma_gravidez_em_situacao_de_risco"
    t.string   "tem_dst_ets_std"
    t.string   "não_tem_acesso_a_servicos_medicos_basicos"
    t.string   "praticar_construcoes_corporais_sem_condicoes_medicas_adequadas"
    t.string   "ter_doencas_e_nao_se_tratar"
    t.string   "ter_passado_por_aborto_mal_feito"
    t.string   "tem_tuberculose"
    t.string   "gravidez_indesejada"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "nao_utiliza_preservativos"
    t.string   "vida_sexual_precoce"
    t.string   "nao_faz_testes_medicos"
  end

  create_table "dependent_variables", force: :cascade do |t|
    t.integer  "dependent_education_id"
    t.integer  "drug_id"
    t.integer  "job_id"
    t.integer  "sexual_life_id"
    t.integer  "self_security_id"
    t.integer  "dependent_health_id"
    t.integer  "group_life_id"
    t.integer  "family_id"
    t.integer  "alcohol_id"
    t.integer  "legality_id"
    t.integer  "home_id"
    t.integer  "hygiene_id"
    t.integer  "feeding_id"
    t.integer  "psychological_situation_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "main_network_id"
    t.integer  "basic_assistance_id"
  end

  add_index "dependent_variables", ["alcohol_id"], name: "index_dependent_variables_on_alcohol_id", using: :btree
  add_index "dependent_variables", ["basic_assistance_id"], name: "index_dependent_variables_on_basic_assistance_id", using: :btree
  add_index "dependent_variables", ["dependent_education_id"], name: "index_dependent_variables_on_dependent_education_id", using: :btree
  add_index "dependent_variables", ["dependent_health_id"], name: "index_dependent_variables_on_dependent_health_id", using: :btree
  add_index "dependent_variables", ["drug_id"], name: "index_dependent_variables_on_drug_id", using: :btree
  add_index "dependent_variables", ["family_id"], name: "index_dependent_variables_on_family_id", using: :btree
  add_index "dependent_variables", ["feeding_id"], name: "index_dependent_variables_on_feeding_id", using: :btree
  add_index "dependent_variables", ["group_life_id"], name: "index_dependent_variables_on_group_life_id", using: :btree
  add_index "dependent_variables", ["home_id"], name: "index_dependent_variables_on_home_id", using: :btree
  add_index "dependent_variables", ["hygiene_id"], name: "index_dependent_variables_on_hygiene_id", using: :btree
  add_index "dependent_variables", ["job_id"], name: "index_dependent_variables_on_job_id", using: :btree
  add_index "dependent_variables", ["legality_id"], name: "index_dependent_variables_on_legality_id", using: :btree
  add_index "dependent_variables", ["main_network_id"], name: "index_dependent_variables_on_main_network_id", using: :btree
  add_index "dependent_variables", ["psychological_situation_id"], name: "index_dependent_variables_on_psychological_situation_id", using: :btree
  add_index "dependent_variables", ["self_security_id"], name: "index_dependent_variables_on_self_security_id", using: :btree
  add_index "dependent_variables", ["sexual_life_id"], name: "index_dependent_variables_on_sexual_life_id", using: :btree

  create_table "diagnosis_and_case_evaluations", force: :cascade do |t|
    t.string   "foi_realizado_um_diagnostico_individual"
    t.string   "foi_realizado_um_diagnostico_familiar"
    t.string   "foi_realizado_um_diagnostico_de_rede"
    t.string   "existe_uma_hpc_ficha_de_primeiro_contato"
    t.string   "existe_uma_spicl_seguimento_de_processos_em_comunidade_locais"
    t.string   "foi_realizada_uma_avaliacao_da_demanda"
    t.string   "foi_realizada_uma_avaliacao_dos_recursos_da_pessoa"
    t.string   "foi_realiazada_uma_avaliacao_dos_recursos_da_rede_subjetiva"
    t.string   "o_processo_de_tratamento_foi_programado_em_equipe"
    t.string   "o_processo_de_tratamento_foi_programa_pela_rede_operativa"
    t.string   "foram_definidos_os_objetivos_e_metas"
    t.string   "objetivos_e_metas_foram_avaliados"
    t.string   "foi_realizada_uma_avaliacao_formal"
    t.string   "o_processo_global_foi_avaliado_em_equipe"
    t.string   "o_processo_foi_concluido"
    t.string   "o_processo_foi_interrompido"
    t.string   "a_pessoa_faleceu"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "diaries", force: :cascade do |t|
    t.text     "description"
    t.date     "date"
    t.integer  "user_id"
    t.integer  "beneficiary_id"
    t.string   "type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "axis"
  end

  add_index "diaries", ["beneficiary_id"], name: "index_diaries_on_beneficiary_id", using: :btree
  add_index "diaries", ["user_id"], name: "index_diaries_on_user_id", using: :btree

  create_table "drugs", force: :cascade do |t|
    t.string   "cometer_crimes_para_consumir"
    t.string   "usar_simultaneamente_varios_tipos_de_drogas"
    t.string   "usar_agulhas_nao_esterilizadas"
    t.string   "traficar_drogas_como_forma_de_comercio"
    t.string   "traficar_drogas_para_sustentar_o_uso_pessoal"
    t.string   "nao_controlar_a_qualidade_da_substancia"
    t.string   "passar_o_tempo_em_lugares_onde_se_vende_e_consome_drogas"
    t.string   "prostituir_se_para_comprar_droga"
    t.string   "consumir_drogas"
    t.string   "uso_intramuscular_ou_por_intravena"
    t.string   "consumir_novas_drogas"
    t.string   "droga_se_sozinho"
    t.string   "troca_de_vendedor"
    t.string   "droga_se_em_lugares_nao_seguros"
    t.string   "compartilhar_seringas"
    t.string   "usa_cannabis_haxixe_hongos_peiote_datura"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "consumir_alcool"
    t.string   "usar_drogas_pesadas"
    t.string   "misturar_medicamentos"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "oficinas_ou_cursos_de_alfabetizacao"
    t.string   "apoio_para_recuperacao_escolar"
    t.string   "recebeu_ajuda_para_se_inserir_em_uma_escola"
    t.string   "recebeu_uma_bolsa_de_estudos"
    t.string   "foi_inserida_em_uma_escola_formal"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.string   "number"
    t.string   "organization_code"
    t.integer  "beneficiary_id"
    t.integer  "problems_during_process_id"
    t.date     "interruptions"
    t.boolean  "concluded_process"
    t.boolean  "developing_process"
    t.boolean  "suspensions"
    t.date     "evaluation_date"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "independent_variable_id"
    t.integer  "user_id"
    t.integer  "dependent_variable_id"
    t.boolean  "is_active",                  default: true
  end

  add_index "evaluations", ["beneficiary_id"], name: "index_evaluations_on_beneficiary_id", using: :btree
  add_index "evaluations", ["dependent_variable_id"], name: "index_evaluations_on_dependent_variable_id", using: :btree
  add_index "evaluations", ["independent_variable_id"], name: "index_evaluations_on_independent_variable_id", using: :btree
  add_index "evaluations", ["problems_during_process_id"], name: "index_evaluations_on_problems_during_process_id", using: :btree
  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "familia_com_condutas_de_codependencia_"
    t.string   "nao_ter_vinculos_familiares_ou_afetivos"
    t.string   "ter_vinculos_familiares_de_alto_conflito_ou_risco"
    t.string   "foi_expulso_de_sua_familia"
    t.string   "vive_eventos_de_violencia_intrafamiliar"
    t.string   "em_sua_familia_ha_pessoas_dependentes_de_drogas_e_alcool"
    t.string   "familia_desintegrada"
    t.string   "ter_abandonado_sua_familia"
    t.string   "a_familia_pratica_a_exploracao_sexual"
    t.string   "utilizador_de_drogras_ud_ou_udi_que_coloca_em_risco_sua_familia"
    t.string   "ter_algum_familiar_que_produz_vende_comercializa_droga"
    t.string   "familia_em_condicoes_de_extrema_pobreza"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  create_table "feedings", force: :cascade do |t|
    t.string   "alimentar_se_menos_de_uma_vez_ao_dia"
    t.string   "alimentar_se_na_rua_sem_controle_higienico"
    t.string   "ficar_dias_sem_se_alimentar"
    t.string   "tirar_sua_alimentacao_do_lixo"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "field_diaries", force: :cascade do |t|
    t.datetime "data"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_pictures", force: :cascade do |t|
    t.string   "file_name"
    t.string   "content_type"
    t.binary   "file_contents"
    t.integer  "activity_diary_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "file_pictures", ["activity_diary_id"], name: "index_file_pictures_on_activity_diary_id", using: :btree

  create_table "first_contact_files", force: :cascade do |t|
    t.date     "date"
    t.integer  "hour"
    t.string   "institution"
    t.integer  "operational_context_first_contact"
    t.integer  "how_established_first_contact"
    t.integer  "contact_source_type"
    t.integer  "how_person_knew_about_the_organization"
    t.integer  "beneficiary_and_contact_source_relationship"
    t.boolean  "is_new_partner"
    t.integer  "number_of_previous_treatments"
    t.integer  "place_of_previous_treatments"
    t.integer  "marital_status"
    t.integer  "number_sons"
    t.integer  "number_daughters"
    t.integer  "ethnic_group"
    t.string   "religion"
    t.integer  "family_structure"
    t.string   "education_levels"
    t.integer  "job"
    t.string   "first_contact_conditions"
    t.string   "petitions"
    t.string   "answer"
    t.string   "results"
    t.text     "comments"
    t.integer  "beneficiary_id"
    t.integer  "user_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "contact_source_id"
    t.integer  "support_id"
  end

  add_index "first_contact_files", ["beneficiary_id"], name: "index_first_contact_files_on_beneficiary_id", using: :btree
  add_index "first_contact_files", ["user_id"], name: "index_first_contact_files_on_user_id", using: :btree

  create_table "group_lives", force: :cascade do |t|
    t.string   "endividamento_com_o_vendedor_de_drogas"
    t.string   "ser_membro_de_grupo_composto_de_pessoas_de_alto_risco"
    t.string   "participar_de_grupo_com_atividades_criminosas"
    t.string   "ter_amigos_que_consomem_qualquer_tipo_de_droga"
    t.string   "ter_relacoes_afetivas_com_o_vendedor_de_drogas"
    t.string   "ter_perdido_amigos_por_causa_do_consumo_de_spa"
    t.string   "estar_sozinho"
    t.string   "ter_vinculos_com_grupos_ou_pessoas_à_margem_da_lei"
    t.string   "ter_relacoes_conflitivas_com_as_pessoas_com_as_quais_vive"
    t.string   "ser_vitima_de_discriminacao_pelo_grupo_com_o_qual_vive"
    t.string   "nao_usar_drogas_intravena_udi_e_viver_com_pessoa_que_utilizador"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  create_table "guidelines_references", force: :cascade do |t|
    t.string   "foi_orientado_informado_ou_encaminhado_para_uma_escola"
    t.string   "a_gesteo_da_iniciativa_e_feita_em_conjunto"
    t.string   "esta_iniciativa_foi_avaliada_em_conjunto_01"
    t.string   "orientacao_indicacao_encaminhamento_para_uma_oficina"
    t.string   "esta_iniciativa_e_implementada_conjuntamente_01"
    t.string   "esta_iniciativa_foi_avaliada_em_conjunto_02"
    t.string   "orientacao_referente_a_uma_agencia_de_tratamento"
    t.string   "a_gestao_da_iniciativa_e_feita_em_conjunto_01"
    t.string   "esta_iniciativa_foi_avaliada_em_conjunto_03"
    t.string   "orientacao_referente_a_uma_agencia_de_tratamento_nao_registrada"
    t.string   "a_gestao_da_iniciativa_e_feita_em_conjunto_02"
    t.string   "esta_iniciativa_foi_avaliada_em_conjunto_04"
    t.string   "a_pessoa_recebeu_orientacao_para_uma_possibilidade_de_trabalho"
    t.string   "a_gestao_da_iniciativa_e_feita_em_conjunto_03"
    t.string   "esta_iniciativa_foi_avaliada_em_conjunto_05"
    t.string   "orientacao_sobre_um_hospital_ou_um_serviço_medico"
    t.string   "esta_iniciativa_e_implementada_conjuntamente_02"
    t.string   "esta_iniciativa_foi_avaliada_em_conjunto_06"
    t.string   "orientacoes_sobre_atividades_grupos_participacao_sociocultural"
    t.string   "esta_iniciativa_e_implementada_conjuntamente_003"
    t.string   "esta_iniciativa_foi_avaliada_em_conjunto_07"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  create_table "healths", force: :cascade do |t|
    t.string   "sobre_hiv"
    t.string   "sobre_sexo_seguro_"
    t.string   "sobre_uso_seguro_de_drogas"
    t.string   "sobre_doencas_transmitidas_por_via_sanguinea_e_sexual"
    t.string   "primeros_socorros"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string   "viver_em_espacos_publicos_em_mas_condicoes"
    t.string   "viver_com_pessoas_de_alto_risco"
    t.string   "viver_em_lugares_de_consumo"
    t.string   "viver_em_lugares_sem_higiene_nem_servicos_basicos"
    t.string   "moradia_precaria"
    t.string   "viver_em_estruturas_semelhantes_ao_cortico"
    t.string   "viver_em_zonas_com_presenca_de_grupos_armados_a_margem_da_lei"
    t.string   "vivir_en_superlotacao"
    t.string   "viver_em_uma_comunidade_de_alto_risco"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "hygienes", force: :cascade do |t|
    t.string   "trocar_de_roupa_menos_de_uma_vez_por_semana"
    t.string   "tomar_banho_menos_de_uma_vez_por_semana"
    t.string   "nao_ter_um_lugar_para_tomar_banho"
    t.string   "nao_ter_roupa_limpa"
    t.string   "nao_cuidar_da_limpeza_de_seu_espaco_moradia"
    t.string   "lavar_sua_roupa_menos_de_uma_vez_por_semana"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "independent_variables", force: :cascade do |t|
    t.integer  "assistance_activity_id"
    t.integer  "community_treatment_id"
    t.integer  "albergue_id"
    t.integer  "diagnosis_and_case_evaluation_id"
    t.integer  "education_id"
    t.integer  "guidelines_reference_id"
    t.integer  "health_id"
    t.integer  "involved_structure_id"
    t.integer  "social_participation_id"
    t.integer  "used_technique_id"
    t.integer  "work_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "axis_1_id"
    t.integer  "axis_2_id"
    t.integer  "axis_3_id"
    t.integer  "axis_4_id"
    t.integer  "axis_5_id"
    t.integer  "axis1_id"
    t.integer  "axis2_id"
    t.integer  "axis3_id"
    t.integer  "axis4_id"
    t.integer  "axis5_id"
  end

  add_index "independent_variables", ["albergue_id"], name: "index_independent_variables_on_albergue_id", using: :btree
  add_index "independent_variables", ["assistance_activity_id"], name: "index_independent_variables_on_assistance_activity_id", using: :btree
  add_index "independent_variables", ["axis1_id"], name: "index_independent_variables_on_axis1_id", using: :btree
  add_index "independent_variables", ["axis2_id"], name: "index_independent_variables_on_axis2_id", using: :btree
  add_index "independent_variables", ["axis3_id"], name: "index_independent_variables_on_axis3_id", using: :btree
  add_index "independent_variables", ["axis4_id"], name: "index_independent_variables_on_axis4_id", using: :btree
  add_index "independent_variables", ["axis5_id"], name: "index_independent_variables_on_axis5_id", using: :btree
  add_index "independent_variables", ["axis_1_id"], name: "index_independent_variables_on_axis_1_id", using: :btree
  add_index "independent_variables", ["axis_2_id"], name: "index_independent_variables_on_axis_2_id", using: :btree
  add_index "independent_variables", ["axis_3_id"], name: "index_independent_variables_on_axis_3_id", using: :btree
  add_index "independent_variables", ["axis_4_id"], name: "index_independent_variables_on_axis_4_id", using: :btree
  add_index "independent_variables", ["axis_5_id"], name: "index_independent_variables_on_axis_5_id", using: :btree
  add_index "independent_variables", ["community_treatment_id"], name: "index_independent_variables_on_community_treatment_id", using: :btree
  add_index "independent_variables", ["diagnosis_and_case_evaluation_id"], name: "index_independent_variables_on_diagnosis_and_case_evaluation_id", using: :btree
  add_index "independent_variables", ["education_id"], name: "index_independent_variables_on_education_id", using: :btree
  add_index "independent_variables", ["guidelines_reference_id"], name: "index_independent_variables_on_guidelines_reference_id", using: :btree
  add_index "independent_variables", ["health_id"], name: "index_independent_variables_on_health_id", using: :btree
  add_index "independent_variables", ["involved_structure_id"], name: "index_independent_variables_on_involved_structure_id", using: :btree
  add_index "independent_variables", ["social_participation_id"], name: "index_independent_variables_on_social_participation_id", using: :btree
  add_index "independent_variables", ["used_technique_id"], name: "index_independent_variables_on_used_technique_id", using: :btree
  add_index "independent_variables", ["work_id"], name: "index_independent_variables_on_work_id", using: :btree

  create_table "involved_structures", force: :cascade do |t|
    t.string   "territorios_comunitarios"
    t.string   "ha_bens_e_serviços_na_comunidade_tidos_como_naturais"
    t.string   "recursos_oferecidos_pelos_atores_tidos_como_privados"
    t.string   "centros_de_baixa_de_exigencia_e_baixa_complexidade"
    t.string   "centros_de_baixa_de_exigencia_e_media_complexidade"
    t.string   "centros_de_baixa_de_exigencia_e_alta_complexidade"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "ter_ocupacao_ilegal"
    t.string   "estar_sem_trabalho_ou_sem_ocupacao"
    t.string   "trabalhar_em_lugares_que_promove_ou_exigem_o_consumo_de_drogas"
    t.string   "ter_ocupacao_de_alto_risco_relacionado_a_drogas_ou_seguranca"
    t.string   "ter_um_trabalho_no_qual_ha_exploracao_grave_de_mao_de_obra"
    t.string   "vive_em_um_contexto_onde_nao_ha_oportunidades_de_trabalho"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "mantem_se_com_dinheiro_ilegal"
    t.string   "nao_tem_officio_ou_habilidades"
    t.string   "traficar_drogas"
  end

  create_table "legalities", force: :cascade do |t|
    t.string   "cometer_roubos"
    t.string   "cometer_assaltos"
    t.string   "traficar_drogas"
    t.string   "pertencer_a_grupos_criminosos_e_quadrilhas"
    t.string   "estar_na_prisao"
    t.string   "participar_em_acoes_criminosas"
    t.string   "consumir_drogas_em_lugares_publicos"
    t.string   "ter_documentos_falsos"
    t.string   "portar_armas_sem_salvo_conduto_e_armas_brancas"
    t.string   "manter_se_com_dinheiro_e_produtos_de_atividades_criminosas"
    t.string   "ter_estado_privado_de_liberdade"
    t.string   "estar_sem_documentos_legais_de_imigrante"
    t.string   "nao_ter_documentos_de_identidade"
    t.string   "cometer_homicidios_ou_produzir_lesoes_a_outrem"
    t.string   "ser_fugitivo_da_justica_ou_reu_ausente"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "main_networks", force: :cascade do |t|
    t.string   "i_9_1"
    t.string   "i_9_2"
    t.string   "i_9_3"
    t.string   "i_9_4"
    t.string   "i_9_5"
    t.string   "i_9_6"
    t.string   "i_9_7"
    t.string   "i_9_8"
    t.string   "i_9_9"
    t.string   "i_9_10"
    t.string   "i_9_11"
    t.string   "i_9_12"
    t.string   "i_9_13"
    t.string   "i_9_14"
    t.string   "i_9_15"
    t.string   "i_9_16"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "fantasy_name"
    t.integer  "people_id"
    t.integer  "contact_person_1_id"
    t.integer  "contact_person_2_id"
    t.string   "cnpj"
    t.integer  "partner_type"
    t.boolean  "is_active",           default: true
    t.string   "work_areas"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "partners", ["person_id"], name: "index_partners_on_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.integer  "age",        default: 0
    t.integer  "gender"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "email"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "cpf"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phones", ["person_id"], name: "index_phones_on_person_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "comunity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "points", ["comunity_id"], name: "index_points_on_comunity_id", using: :btree

  create_table "ppcls", force: :cascade do |t|
    t.string   "name"
    t.string   "dc_reference"
    t.integer  "age"
    t.integer  "gender"
    t.string   "relationship"
    t.string   "social_role"
    t.integer  "partner_device"
    t.integer  "treatment_device"
    t.integer  "institutional_device"
    t.integer  "beneficiary_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
  end

  add_index "ppcls", ["beneficiary_id"], name: "index_ppcls_on_beneficiary_id", using: :btree
  add_index "ppcls", ["user_id"], name: "index_ppcls_on_user_id", using: :btree

  create_table "problems_during_processes", force: :cascade do |t|
    t.string   "sustancias_alcool"
    t.string   "condutas_antissociais"
    t.string   "psiquiatricas"
    t.string   "comportamentais"
    t.string   "relacionais"
    t.string   "violencia_intrafamiliar"
    t.string   "violacao_abuso_sexual_adultos"
    t.string   "trabalho_sexual"
    t.string   "legal"
    t.string   "gravidez_parto"
    t.string   "doencas"
    t.string   "pobreza_extrema"
    t.string   "vida_na_rua"
    t.string   "apoio_econômico"
    t.string   "escolares"
    t.string   "exclusao_grave"
    t.string   "violencia_intracomunitaria"
    t.string   "redes_interinstitucionais"
    t.string   "crises_psicologicas"
    t.string   "capacitacao_e_formacao"
    t.string   "organizacao_e_planejamento"
    t.string   "hiv"
    t.string   "enfermidades_por_transmissao_sexual"
    t.string   "trafico_de_pessoas"
    t.string   "sem_trabalho"
    t.string   "tuberculose"
    t.string   "problemas_familiares"
    t.string   "transtorno_de_estres_pos_traumatico"
    t.string   "analfabetismo"
    t.string   "problemas_sexuais"
    t.string   "violacao_abuso_de_criancas"
    t.string   "outras_dependencias"
    t.string   "uso_de_drogas_intravenosa"
    t.string   "hepatites"
    t.string   "deslocacao_forcada"
    t.string   "migracao_ou_imigracao"
    t.string   "estigma_por_sua_identidade_sexual"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "psychological_situations", force: :cascade do |t|
    t.string   "viver_uma_depressao"
    t.string   "viver_experiencias_psicoticas"
    t.string   "viver_transtornos_de_limites_de_personalidade"
    t.string   "viver_situacao_de_panico"
    t.string   "transtorno_de_ansiedade"
    t.string   "personalidade_antissocial"
    t.string   "alteracoes_graves_do_humor_devido_ao_abuso_de_substancias"
    t.string   "somatizar_situacoes_de_estres_ou_conflito"
    t.string   "viver_situacoes_de_luto"
    t.string   "transtorno_por_estres_pos_traumatico"
    t.string   "troca_de_conduta_depois_de_ter_sido_vitima_de_violencia"
    t.string   "teve_pensamentos_de_suicidio"
    t.string   "tentou_suicidio"
    t.string   "lhe_foi_receitado_algum_medicamento_por_problema_psicologico"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  create_table "self_securities", force: :cascade do |t|
    t.string   "tem_inimigos"
    t.string   "viver_em_comunidades_de_alto_risco"
    t.string   "realizar_atividades_ilegais"
    t.string   "andar_armado"
    t.string   "ter_condutas_violentas_frente_aos_outros"
    t.string   "pertencer_a_grupos_organizados_de_alto_risco"
    t.string   "nao_ter_um_grupo_de_referencia_estar_sozinho"
    t.string   "trabalhar_como_operador_de_rua"
    t.string   "nao_ter_vinculacao_com_instancias_licitas_e_legais"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "estar_preso"
    t.string   "cometer_crime"
    t.string   "relacao_companheiro_perigoso"
    t.string   "relacao_sob_efeito_droga"
    t.string   "relacao_lugar_risco"
  end

  create_table "sexual_lives", force: :cascade do |t|
    t.string   "nao_utiliza_preservativos"
    t.string   "ter_relacoes_sexuais_com_companheiros_perigosos_"
    t.string   "ter_relacoes_sexuais_sob_efeito_de_droga_intoxicado_etc"
    t.string   "ter_relacoes_sexuais_de_maneira_desprotegida_com_o_a_parceiro_a"
    t.string   "ter_relacoes_sexuais_em_lugares_de_alto_risco"
    t.string   "iniciar_a_vida_sexual_precocemente_sem_infomacoes"
    t.string   "nao_tomar_em_conta_periodo_latente_nos_testes_clinicos_para_hiv"
    t.string   "nao_fazer_testes_medicos_periodicos"
    t.string   "nao_fazer_teste_clinico_apos_relacao_sexual_sem_preservativo"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  create_table "social_participations", force: :cascade do |t|
    t.string   "recebeu_ajuda_para_participar_de_grupos_e_associacoes"
    t.string   "educacao_em_direitos_humanos_e_sociais"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "used_techniques", force: :cascade do |t|
    t.string   "aconselhamento_e_orientacao_individual"
    t.string   "psicoterapia_individual"
    t.string   "visitas_familiares"
    t.string   "participacao_em_grupos_de_discucao"
    t.string   "terapia_de_grupo"
    t.string   "terapia_familiar"
    t.string   "terapia_de_rede"
    t.string   "grupo_de_autoajuda"
    t.string   "trabalhou_na_organizacao_como_forma_de_tratamento"
    t.string   "trabalhou_como_operador_para_a_organizacao"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.boolean  "is_active",              default: true
    t.integer  "person_id"
    t.integer  "partner_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["partner_id"], name: "index_users_on_partner_id", using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "oficinas_para_capacitacao_profissional"
    t.string   "realizou_uma_pratica_de_trabalho"
    t.string   "recebeu_ajuda_para_encontrar_trabalho"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_foreign_key "activities", "departments"
  add_foreign_key "activity_diaries", "activities"
  add_foreign_key "activity_diaries", "diaries"
  add_foreign_key "dependent_variables", "alcohols"
  add_foreign_key "dependent_variables", "basic_assistances"
  add_foreign_key "dependent_variables", "dependent_educations"
  add_foreign_key "dependent_variables", "dependent_healths"
  add_foreign_key "dependent_variables", "drugs"
  add_foreign_key "dependent_variables", "families"
  add_foreign_key "dependent_variables", "feedings"
  add_foreign_key "dependent_variables", "group_lives"
  add_foreign_key "dependent_variables", "homes"
  add_foreign_key "dependent_variables", "hygienes"
  add_foreign_key "dependent_variables", "jobs"
  add_foreign_key "dependent_variables", "legalities"
  add_foreign_key "dependent_variables", "main_networks"
  add_foreign_key "dependent_variables", "psychological_situations"
  add_foreign_key "dependent_variables", "self_securities"
  add_foreign_key "dependent_variables", "sexual_lives"
  add_foreign_key "diaries", "beneficiaries"
  add_foreign_key "diaries", "users"
  add_foreign_key "evaluations", "beneficiaries"
  add_foreign_key "evaluations", "dependent_variables"
  add_foreign_key "evaluations", "independent_variables"
  add_foreign_key "evaluations", "problems_during_processes"
  add_foreign_key "evaluations", "users"
  add_foreign_key "file_pictures", "activity_diaries"
  add_foreign_key "independent_variables", "albergues"
  add_foreign_key "independent_variables", "assistance_activities"
  add_foreign_key "independent_variables", "axis1s"
  add_foreign_key "independent_variables", "axis2s"
  add_foreign_key "independent_variables", "axis3s"
  add_foreign_key "independent_variables", "axis4s"
  add_foreign_key "independent_variables", "axis5s"
  add_foreign_key "independent_variables", "axis_1s"
  add_foreign_key "independent_variables", "axis_2s"
  add_foreign_key "independent_variables", "axis_3s"
  add_foreign_key "independent_variables", "axis_4s"
  add_foreign_key "independent_variables", "axis_5s"
  add_foreign_key "independent_variables", "community_treatments"
  add_foreign_key "independent_variables", "diagnosis_and_case_evaluations"
  add_foreign_key "independent_variables", "educations"
  add_foreign_key "independent_variables", "guidelines_references"
  add_foreign_key "independent_variables", "healths"
  add_foreign_key "independent_variables", "involved_structures"
  add_foreign_key "independent_variables", "social_participations"
  add_foreign_key "independent_variables", "used_techniques"
  add_foreign_key "independent_variables", "works"
  add_foreign_key "partners", "people"
  add_foreign_key "ppcls", "beneficiaries"
  add_foreign_key "ppcls", "users"
  add_foreign_key "users", "partners"
end
