#Albums belong to an artist
#Albums can belong to many playlists (album id:1 can exist in playlist id:1,2,3 etc)

class CreateAlbums < ActiveRecord::Migration[4.2]
    def change
      create_table :albums do |t|
        t.string :title
        t.string :artist
        t.timestamps
    end
end
  end