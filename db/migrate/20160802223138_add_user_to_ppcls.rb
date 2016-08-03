class AddUserToPpcls < ActiveRecord::Migration
  def change
    add_reference :ppcls, :user, index: true, foreign_key: true
  end
end
