require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song 
    return song
  end
  
  def self.new_by_name(song_name)
     new_song = self.new 
     new_song.name = song_name
     return new_song
  end 
  
  def self.create_by_name(song_name) 
      new_song = self.create 
      new_song.name = song_name
      return new_song
  end 
  
  def self.find_by_name(song_name)
    @@all.each do |song| 
      if song.name == song_name
        return song
      end 
    end 
       return false
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.find_or_create_by_name(song_name)
  end
    
      
  
  # .find_or_create_by_name
  #   invokes .find_by_name and .create_by_name instead of repeating code (FAILED- 1)
  #   returns the existing Song object (doesn't create a new one) when provided the title of an existing Song (FAILED - 2)
  #   creates a new Song object with the provided title if one doesn't already exist (FAILED - 3)
  
   def self.alphabetical
     @@all.sort_by(&:name)
   end
   
   def self.new_from_filename(file)
      new_file = self.new 
      new_file.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
      new_file.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
      return new_file 
   end
    
   def self.create_from_filename(file)
      new_file = self.new 
      new_file.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
      new_file.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
      new_file.save
      return new_file
   end
  
   def self.destroy_all
    self.all.clear
  end
    
  
end