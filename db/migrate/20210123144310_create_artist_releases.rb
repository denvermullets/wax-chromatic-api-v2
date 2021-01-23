class CreateArtistReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_releases do |t|

      t.timestamps
    end
  end
end
