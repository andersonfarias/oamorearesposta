class ChangeDateFormatInFieldDiary < ActiveRecord::Migration[4.2]
  def change
  	change_column(:field_diaries, :data, :date)
  end
end
