class CreateReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :releases do |t|
      t.string :discogs_release
      t.string :discogs_artist
      t.string :title
      t.string :artist
      t.timestamps
    end
  end
end
