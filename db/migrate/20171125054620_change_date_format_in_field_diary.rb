class ChangeDateFormatInFieldDiary < ActiveRecord::Migration
  def change
  	change_column(:field_diaries, :data, :date)
  end
end
