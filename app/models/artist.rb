class Artist < ActiveRecord::Base
    has_many :albums
    has_many :playlists, through: :albums
  end