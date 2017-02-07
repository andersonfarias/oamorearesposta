class CreateDependentVariables < ActiveRecord::Migration
  def change
    create_table :dependent_variables do |t|
      t.references :dependent_education, index: true, foreign_key: true
      t.references :drug, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.references :sexual_life, index: true, foreign_key: true
      t.references :self_security, index: true, foreign_key: true
      t.references :dependent_health, index: true, foreign_key: true
      t.references :group_life, index: true, foreign_key: true
      t.references :family, index: true, foreign_key: true
      t.references :alcohol, index: true, foreign_key: true
      t.references :legality, index: true, foreign_key: true
      t.references :home, index: true, foreign_key: true
      t.references :hygiene, index: true, foreign_key: true
      t.references :feeding, index: true, foreign_key: true
      t.references :psychological_situation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
