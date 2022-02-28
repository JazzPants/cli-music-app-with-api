#Step 1
require_relative './url.rb'
#user responses
#interact with user

#initialize welcome to the app

class CLI
  attr_accessor :username

  def start
    puts 'Welcome to Music Lovers!'

    #get_user_data, ask user name, else create one, or ask to view existing

    puts 'Please select an option.'
    start_menu_options

    #please enter your username to make a playlist

    # if username
    #     user_menu_options
    # else
    #exit_option
  end

  def start_menu_options
    puts "type '1' to enter your username"
    puts "type '2' to create a new user"
    puts "type '3' to exit application"
    start_menu
  end

  def start_menu
    input = gets.chomp
    if input == '1'
      enter_username
    elsif input == '2'
      create_user
    else
      puts 'exiting application'
      exit
    end
  end

  def enter_username
    puts 'Please enter your username (case-sensitive)'
    input = gets.chomp
    if User.find_by(username: input)
      puts "Success! User: #{input} found!"
      self.username = input
      user_menu_options
    else
      puts "User: #{input} does not exist!"
      start_menu_options
    end
    #save user input to database
    #username does not exist, would you like to create one?
  end

  def create_user
    puts 'Please enter a new username'
    usernameInput = gets.chomp
    puts "Do you want to use the username #{usernameInput} y/n?"
    yesNoInput = gets.chomp

    #   yesNoInput == 'y' ? User.create(username: usernameInput) : start_menu
    if yesNoInput == 'y'
      User.create(username: usernameInput)
      self.username = usernameInput
    else
      start_menu
    end
    puts "User: #{usernameInput} created."
    user_menu_options
  end

  def user_menu_options
    puts "Welcome to Music Lovers, #{self.username}"
    puts 'Please select an option'
    puts "type '1' for artist search"
    puts "type '2' for current playlists"
    puts "type '3' to create a playlist"
    puts "type '4' to exit application."
    user_menu
  end

  def user_menu
    input = gets.chomp
    if input == '1'
      enter_artist
    elsif input == '2'
      display_playlists
    elsif input == '3'
      create_playlist
    else
      puts 'exiting application'
      exit
    end
  end

  def enter_artist
    puts 'Please enter an artist.'
    input = gets.chomp
    p input.split(%r{ |\_|\-}).map(&:capitalize).join(' ')
    artist = Url.new
    artist.new_by_user_input(input)
    puts 'Loading API...'
    puts "**#{input} - Albums**"
    artist.show_albums

    #add_album
    puts 'Please type in a playlist to add albums to (case-sensitive)'
    display_playlists

    playlistInput = gets.chomp
    playlistId = Playlist.find_by(name: "#{playlistInput}").id
    puts "Current playlist: #{playlistInput}"

    puts 'Please select a number to add that corresponding album to your playlist'
    numberInput = gets.chomp.to_i
    albumToInsert = artist.albums[numberInput - 1]
    puts "#{albumToInsert} added to #{playlistInput}"
    Album.create(title: "#{albumToInsert}", artist: input)
    albumId = Album.find_by(title: albumToInsert).id
    AlbumsPlaylists.create(album_id: albumId, playlist_id: playlistId)

    #add_album
    user_menu_options
  end

  #   def add_album
  #   end

  def display_playlists
    id = User.find_by(username: self.username).id
    puts "User id is #{id}"
    playlists = Playlist.all.where(user_id: id)
    p playlists

    # playlistArray = []
    #   puts 'Please select a number to select that corresponding playlist'
    #check playlist table is empty
    if playlists.find_by(id: 1)
      playlists.each { |playlist| puts playlist.name }
      inspect_playlist
      #   puts 'Would you like to add to this playlist?'
    else
      puts 'No playlists exist! Please create one!'
      user_menu_options
    end
    #select a playlist to add albums to
  end

  def inspect_playlist
    puts "Please type a playlist to view it's albums (case-sensitive)"
    input = gets.chomp
    playlistId = Playlist.find_by(name: "#{input}").id
    albumsJoin = AlbumsPlaylists.all.where(playlist_id: playlistId)
    albumsJoin.each do |albumJoin|
      p Album.find_by(id: albumJoin.album_id).title
    end
    user_menu_options
    # album ids with playlistId from join table push those into empty array
    #get the title of each album id and print
  end

  def create_playlist
    id = User.find_by(username: self.username).id
    puts 'Please type a name for your new playlist'
    input = gets.chomp
    puts "Do you want to use the playlist name #{input} y/n?"
    yesNoInput = gets.chomp

    #   yesNoInput == 'y' ? User.create(username: usernameInput) : start_menu
    if yesNoInput == 'y'
      Playlist.create(name: input, user_id: id)
    else
      user_menu_options
    end
    puts "Playlist called: #{input} created."
    user_menu_options
  end
end

#   musiclover55 = CLI.new
#   musiclover55.username = "musiclover55"
#   p musiclover55.username

# p "testFetch"
# testFetch = GetAlbums.new
# testFetch.show_albums
