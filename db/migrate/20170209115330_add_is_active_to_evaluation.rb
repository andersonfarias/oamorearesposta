class AddIsActiveToEvaluation < ActiveRecord::Migration
  def change
  	add_column :evaluations, :is_active, :boolean, :default => true
  end
end
