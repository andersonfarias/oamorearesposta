class AddUserRefefencesToEvaluation < ActiveRecord::Migration[4.2]
  def change
    add_reference :evaluations, :user, index: true, foreign_key: true
  end
end
