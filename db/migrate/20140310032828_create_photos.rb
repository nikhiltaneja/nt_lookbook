class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :standard_url
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
