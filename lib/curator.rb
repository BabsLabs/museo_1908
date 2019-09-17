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
    artist_we_are_looking_for = ''
    @artists.each do |artist|
      if artist.id == id
        artist_we_are_looking_for = artist
      end
    end
    artist_we_are_looking_for
  end

  def find_photograph_by_id(id)
    photo_we_are_looking_for = ''
    @photographs.each do |photo|
      if photo.id == id
        photo_we_are_looking_for = photo
      end
    end
    photo_we_are_looking_for
  end

end