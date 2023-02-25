class AddReferencesToDependentVariable < ActiveRecord::Migration[4.2]
  def change
    add_reference :dependent_variables, :main_network, index: true, foreign_key: true
    add_reference :dependent_variables, :basic_assistance, index: true, foreign_key: true
  end
end
