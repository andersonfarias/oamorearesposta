class AddUserToFieldDiary < ActiveRecord::Migration
  def change
  	add_reference :field_diaries, :user, index: true, foreign_key: true
  end
end
