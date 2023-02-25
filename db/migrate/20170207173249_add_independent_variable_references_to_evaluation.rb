class AddIndependentVariableReferencesToEvaluation < ActiveRecord::Migration[4.2]
  def change
    add_reference :evaluations, :independent_variable, index: true, foreign_key: true
  end
end
