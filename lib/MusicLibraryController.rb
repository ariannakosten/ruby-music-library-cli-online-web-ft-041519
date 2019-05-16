require "pry"
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path) 
    importer.import
  end
  
  def call 
    
    input = ""
    
    while input != "exit"
    
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end
  
def list_songs
    songs = Song.all.sort #{|a, b| a.name <=> b.name}
    songs.each.with_index(1) {|song, index| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end

def list_artists
    # Artist.all.each {|artist| puts artist.name}
    artists = Artist.all.sort #{|a, b| a.name <=> b.name}
    artists.each.with_index(1) {|artist, index| puts "#{index}. #{artist.name}"}
  end

def list_genres
    genres = Genre.all.sort #{|a, b| a.name <=> b.name} do i need a block for sort
    genres.each.with_index(1) {|genre, index| puts "#{index}. #{genre.name}"}
  end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      songs_by_artist = artist.songs.sort #{ |a, b| a.name <=> b.name }
      songs_by_artist.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end
  end


def list_songs_by_genre
   puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      songs_by_genre = genre.songs.sort #{ |a, b| a.name <=> b.name }
      songs_by_genre.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
    end
  end


def play_song
  puts "Which song number would you like to play?"
  input = gets.strip
end
end