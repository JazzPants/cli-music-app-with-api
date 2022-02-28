require 'net/http'
require 'open-uri'
require 'json'

class Url
  attr_accessor :name, :albums

  def initialize
    @albums = []
  end

  # URL = "https://theaudiodb.com/api/v1/json/2/discography.php?s=michael%20jackson"

  def new_by_user_input(input)
    self.name =
      "https://theaudiodb.com/api/v1/json/2/discography.php?s=#{input}"
  end

  def get_albums
    uri = URI.parse(self.name)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def show_albums
    albums = JSON.parse(self.get_albums)
    albumsArray = albums['album']
    albumsArray.map.with_index do |album, i|
      self.albums.push(album['strAlbum'])
      puts "#{i + 1}. #{album['strAlbum']}"
    end
  end
end
