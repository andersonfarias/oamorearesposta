class AddIndependentVariableReferencesToEvaluation < ActiveRecord::Migration
  def change
    add_reference :evaluations, :independent_variable, index: true, foreign_key: true
  end
end
