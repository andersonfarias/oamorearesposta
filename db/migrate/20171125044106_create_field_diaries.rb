class CreateFieldDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :field_diaries do |t|
      t.datetime :data
      t.text :descricao

      t.timestamps
    end
  end
end
