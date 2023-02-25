class AddUserToPpcls < ActiveRecord::Migration[4.2]
  def change
    add_reference :ppcls, :user, index: true, foreign_key: true
  end
end
