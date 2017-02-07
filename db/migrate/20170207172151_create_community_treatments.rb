class CreateCommunityTreatments < ActiveRecord::Migration
  def change
    create_table :community_treatments do |t|
      t.string :a_equipe_foi_envolvida
      t.string :a_rede_subjetiva_comunitaria_foi_envolvida
      t.string :a_rede_operativa_foi_envolvida
      t.string :a_rede_de_recursos_comunitarios_foi_envolvida
      t.string :a_rede_de_lideres_de_opiniao_foi_envolvida
      t.string :a_rede_subjetiva_do_parceiro_foi_envolvida

      t.timestamps null: false
    end
  end
end
