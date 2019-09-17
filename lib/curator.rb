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

end