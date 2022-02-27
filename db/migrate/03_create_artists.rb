#artist has many albums
#artist can belong to many playlists


class CreateArtists < ActiveRecord::Migration[4.2]
    def change
      create_table :artists do |t|
        t.string :name
        # t.integer :playlist_id
    end
  end