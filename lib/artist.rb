
class Artist
    
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end
        
    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find do |artist|
            artist.name == name
        end
        
        if artist == nil
            artist = Artist.new(name)
        end

        return artist
    end

    def print_songs
        song_array = self.songs
        song_array.each do |song|
            puts song.name
        end
    end

end
