class AddUserToFieldDiary < ActiveRecord::Migration[4.2]
  def change
  	add_reference :field_diaries, :user, index: true, foreign_key: true
  end
end
