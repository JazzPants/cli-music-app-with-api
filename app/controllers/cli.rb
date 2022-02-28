#Step 1
require_relative "./url.rb"
#user responses
#interact with user

#initialize welcome to the app

class CLI
    attr_accessor :username
  
    def start
      puts 'Welcome to Music Lovers!'
  
      #get_user_data, ask user name, else create one, or ask to view existing
      puts 'Loading API...'
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
      puts 'Please enter your username'
      input = gets.chomp
      if User.find_by(username: input)
        puts "Success! User: #{input} found!"
        self.username = input
        user_menu_options
      else
        puts "User: #{input} does not exist!"
        exit
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
      else
        puts 'exiting application'
        exit
      end
    end

    def enter_artist
    end

    def display_playlists
        id = User.find_by(username: self.username).id
        p Playlist.find_by(id: id)
        #select a playlist to add albums to
    end
  end
  
#   musiclover55 = CLI.new
#   musiclover55.username = "musiclover55"
#   p musiclover55.username

# p "testFetch"
# testFetch = GetAlbums.new
# testFetch.show_albums