class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :website
      t.string :discogs_artist
      t.timestamps
    end
  end
end
