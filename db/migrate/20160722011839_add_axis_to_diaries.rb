class AddAxisToDiaries < ActiveRecord::Migration
  def change
    add_column :diaries, :axis, :string
  end
end
