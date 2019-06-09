require_relative 'song'
require_relative 'genre'

require 'pry'

class Artist
    @@all = []
    attr_reader :name
    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def new_song(name, genre)
         Song.new(name, self, genre)
    end

    def songs
        Song.songs.select { |song| song.artist == self}
    end

    def genres
        Song.songs.map {|song| song.genre}.uniq
    end

end