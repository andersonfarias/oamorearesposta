class AddReferencesToDependentVariable < ActiveRecord::Migration
  def change
    add_reference :dependent_variables, :main_network, index: true, foreign_key: true
    add_reference :dependent_variables, :basic_assistance, index: true, foreign_key: true
  end
end
