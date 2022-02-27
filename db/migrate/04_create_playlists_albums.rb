class CreatePlaylistsAlbums < ActiveRecord::Migration[4.2]
        def change
        create_table :playlists_albums, id: false do |t|
            t.belongs_to :playlist
            t.belongs_to :album
            t.timestamps
        end
    end
  end