class CreateFieldDiaries < ActiveRecord::Migration[4.2]
  def change
    create_table :field_diaries do |t|
      t.datetime :data
      t.text :descricao

      t.timestamps null: false
    end
  end
end
