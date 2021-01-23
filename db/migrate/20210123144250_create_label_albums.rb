class CreateLabelAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :label_albums do |t|

      t.timestamps
    end
  end
end
