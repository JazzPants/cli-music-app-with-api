require 'net/http'
require 'open-uri'
require 'json'

class Url
    attr_accessor :name
    URL = "https://theaudiodb.com/api/v1/json/2/discography.php?s=michael%20jackson"
#get user input for artist and interpolate it to put in url
#save artist as instance variable
#attach it to album when inserting an album into playlist db
def new_by_user_input(input)
    # cleanInput = input.gsub()
self.name = "https://theaudiodb.com/api/v1/json/2/discography.php?s=#{input}"
p self.name
end
#bonus: generate random artists
#user can pick one of these random artists and get their albums

    def get_albums
    uri = URI.parse(self.name)
    p uri
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

testUrl = Url.new
testUrl.new_by_user_input("daft punk")
testUrl.get_albums
testUrl.show_albums


