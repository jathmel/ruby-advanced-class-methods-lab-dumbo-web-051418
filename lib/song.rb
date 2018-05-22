class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    # @@all << song
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    @@all << song
    song
  end
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}.uniq
  end

  def self.new_from_filename(filename)
    info_arr = filename.split("-")
    song = Song.new_by_name(info_arr[1][0...-4].strip) #look up regex#.delete('.mp3'))
    song.artist_name = info_arr[0].strip
    song
  end

  def self.create_from_filename(filename)
    info_arr = filename.split(/[-.]/).map {|word| word.strip}
    song = Song.create_by_name(info_arr[1])
    song.artist_name = info_arr[0]

  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
