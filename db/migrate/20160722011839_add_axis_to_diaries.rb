class AddAxisToDiaries < ActiveRecord::Migration[4.2]
  def change
    add_column :diaries, :axis, :string
  end
end
