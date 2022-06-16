class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :photo_gallery, foreign_key: true
      t.string :name
      t.string :description
      t.date :shooting_date

      t.timestamps
    end
  end
end
