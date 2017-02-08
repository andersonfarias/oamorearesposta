class AddDependentVariableReferencesToEvaluation < ActiveRecord::Migration
  def change
    add_reference :evaluations, :dependent_variable, index: true, foreign_key: true
  end
end
