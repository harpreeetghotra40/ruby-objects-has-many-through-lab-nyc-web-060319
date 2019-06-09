require_relative 'song'
require_relative 'artist'

class Genre

    @@genres = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@genres << self
    end

    def songs
        Song.songs.select { |song| song.genre = self }
    end

    def self.all
        @@genres
    end

    def artists
        Song.songs.map { |song| song.artist}.uniq
    end
end