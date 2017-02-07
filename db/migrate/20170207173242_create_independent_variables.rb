class CreateIndependentVariables < ActiveRecord::Migration
  def change
    create_table :independent_variables do |t|
      t.references :assistance_activity, index: true, foreign_key: true
      t.references :community_treatment, index: true, foreign_key: true
      t.references :albergue, index: true, foreign_key: true
      t.references :diagnosis_and_case_evaluation, index: true, foreign_key: true
      t.references :education, index: true, foreign_key: true
      t.references :guidelines_reference, index: true, foreign_key: true
      t.references :health, index: true, foreign_key: true
      t.references :involved_structure, index: true, foreign_key: true
      t.references :social_participation, index: true, foreign_key: true
      t.references :used_technique, index: true, foreign_key: true
      t.references :work, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
