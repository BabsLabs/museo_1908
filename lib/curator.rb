require './lib/file_io'

class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def find_photograph_by_id(id)
    @photographs.find { |photo| photo.id == id }
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all { |photo| artist.id == photo.artist_id }
  end

  def artists_with_multiple_photographs
    artists_with_multiple_photographs = []
    @artists.each do |artist|
      if find_photographs_by_artist(artist).length >= 2
        artists_with_multiple_photographs << artist
      end
    end
    artists_with_multiple_photographs
  end

  def photographs_taken_by_artist_from(country)
    photographs_taken_by_artist_from = []
    @artists.each do |artist|
      if artist.country == country
        photographs_taken_by_artist_from << find_photographs_by_artist(artist)
      end
    end
    photographs_taken_by_artist_from.flatten
  end

  def load_artists(file)
    @artists = FileIO.load_artists(file)
  end

  def load_photographs(file)
    @photographs =FileIO.load_photographs(file)
  end

  def photographs_taken_between(range)
  end

end