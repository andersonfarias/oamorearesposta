class CreateComunities < ActiveRecord::Migration[4.2]
  def change
    create_table :comunities do |t|
      t.string :name
      t.text :description
      t.string :generators_theme

      t.timestamps null: false
    end
  end
end
