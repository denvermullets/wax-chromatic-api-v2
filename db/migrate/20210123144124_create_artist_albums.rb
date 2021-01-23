class CreateArtistAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_albums do |t|
      t.belongs_to :artist
      t.belongs_to :album
      t.timestamps
    end
  end
end
