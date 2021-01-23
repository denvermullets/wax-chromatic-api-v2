class CreateAlbumGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :album_genres do |t|

      t.timestamps
    end
  end
end
