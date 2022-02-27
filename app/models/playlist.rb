class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :artists
    has_many :albums, through: :artists
  end