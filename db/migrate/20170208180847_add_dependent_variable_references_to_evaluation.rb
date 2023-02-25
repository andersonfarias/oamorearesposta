class AddDependentVariableReferencesToEvaluation < ActiveRecord::Migration[4.2]
  def change
    add_reference :evaluations, :dependent_variable, index: true, foreign_key: true
  end
end
