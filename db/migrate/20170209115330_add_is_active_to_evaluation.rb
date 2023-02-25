class AddIsActiveToEvaluation < ActiveRecord::Migration[4.2]
  def change
  	add_column :evaluations, :is_active, :boolean, :default => true
  end
end
