class Playlist < ActiveRecord::Base
    has_many :artists
    has_many :albums, through: :artists
  end