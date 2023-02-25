class CreateFilePictures < ActiveRecord::Migration[4.2]
  def change
    create_table :file_pictures do |t|
      t.string :file_name
      t.string :content_type
      t.binary :file_contents
      t.references :activity_diary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
