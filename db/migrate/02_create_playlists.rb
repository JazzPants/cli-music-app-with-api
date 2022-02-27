#A playlist will belong to one user
#A playlist has many albums and many artists through albums and vice-versa
#ActiveRecord will help us navigate through these associations

class CreatePlaylists < ActiveRecord::Migration[4.2]
    def change
      create_table :playlists do |t|
        t.string :name
        t.integer :user_id
    end
  end