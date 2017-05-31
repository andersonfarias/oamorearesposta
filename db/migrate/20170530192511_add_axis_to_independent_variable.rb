class AddAxisToIndependentVariable < ActiveRecord::Migration
  def change
    add_reference :independent_variables, :axis1, index: true, foreign_key: true
    add_reference :independent_variables, :axis2, index: true, foreign_key: true
    add_reference :independent_variables, :axis3, index: true, foreign_key: true
    add_reference :independent_variables, :axis4, index: true, foreign_key: true
    add_reference :independent_variables, :axis5, index: true, foreign_key: true
  end
end
