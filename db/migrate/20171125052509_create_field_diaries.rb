class CreateFieldDiaries < ActiveRecord::Migration
  def change
    create_table :field_diaries do |t|
      t.datetime :data
      t.text :descricao

      t.timestamps null: false
    end
  end
end
