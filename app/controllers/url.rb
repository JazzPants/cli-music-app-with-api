require 'net/http'
require 'open-uri'
require 'json'

class GetAlbums
    URL = "https://theaudiodb.com/api/v1/json/2/discography.php?s=michael%20jackson"
#get user input for artist and interpolate it to put in url
#save artist as instance variable
#attach it to album when inserting an album into playlist db

#bonus: generate random artists
#user can pick one of these random artists and get their albums

    def get_albums
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
    end

    def show_albums
        albums = JSON.parse(self.get_albums)
        albumsArray = albums["album"]
        albumsArray.each do |album| 
        puts album["strAlbum"]
        end
    end

end