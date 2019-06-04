Partner B: Jukebox OOP

require_relative "playlist"
require_relative "person
class Jukebox

    attr_reader :dictionary

    def initialize(dictionary, person)
        @dictionary = dictionary
        songs = {}
        @dictionary.each do |sub_array|
            song = sub_array.first
            artist = sub_array.last
            songs[artist] = song
        end
        @person = person
    end

    def display_dictionary(songs)
        songs.each do |song, artist|
            puts "#{song}, by #{artist}"
        end
    end

end

require_relative "person"
class Playlist
    attr_reader :songs, :playlist

    def initialize(songs)
        @songs = songs
    end

    def add_to_playlist(songs, favorite_song, favorite_artist)
        playlist = []
        songs.each do |song, artist|
            if favorite_artist.include?(artist) || favorite_song.include?(song)
                playlist << [song, artist]
            end
        end

        playlist
    end

    def favorites(songs, person)
        artist = person.get_input_favorite_artist
        song = person.get_input_favorite_song
        self.add_to_playlist(songs, song, artist)
    end

end


class Person
    attr_reader :name

    def initialize(name, playlist = [])
        @name = name
        @playlist = playlist
    end

    def get_input_favorite_song(songs)
    puts "please tell us your favorite songs, separated by a space"
       favorite_song = gets.chomp.map.join(" ")
       @playlist << favorite_song
    end

    def get_input_favorite_artist(songs)
    puts "please tell us your favorite artists, separated by a space"
       favorite_artist = gets.chomp.map.join(" ")
       @playlist << favorite_artist
    end

end

class Play_jukebox
    playlist = Playlist.new()
    jukebox = Jukebox.new(dictionary, playlist)
end



Partner A: Parking_Lot OOP




class ParkingGarage

    attr_accessor :levels, :compact_capacity_per_level, :regular_capacity_per_level

    def initialize(levels, compact_capacity_per_level, regular_capacity_per_level)
        @levels = levels #3
        @compact_capacity = compact_capacity_per_level
        @regular_capacity = regular_capacity_per_level
    end

end


class Level

    def initialize(nth_level, compact_capacity, regular_capacity)
        @floor = nth_level
        @compact_capacity = compact_capacity
        @regular_capacity = regular_capacity 
    end

    def park(vehicle)
    
    end

end


class Spot

    def initialize(size)

        @size = size
        @open = true
    end


end


class Vehicle

    def initialize(size)
        @size = size
    end

    def can_fit_in_spot(spot)
       
    end

    def park
        if can_fit_in_spot(size_of_spot)

        end
    end

end


class Bus < Vehicle

    def initialize

    end

end


class Car < Vehicle



end


class Motorcyle < Vehicle



end


class Vehicle
  attr_reader :spots_needed, :size

  def initialize(license_plate)
    @parking_spots = []
    @license_plate = license_plate
  end

  def park_in_spot(spot)
    # ...
  end

  def clear_spots
    # ...
  end

  def can_fit_in_spot(spot)
    # ...
  end
end

class Bus < Vehicle
  def initialize
    super
    @spots_needed = 5
    @size = :large
  end

  def can_fit_in_spot(spot)
    # Checks if spot is :large
  end
end

class Car < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end

  def can_fit_in_spot(spot)
    # Check if spot is :compact or :large
  end
end

class Motorcycle < Vehicle
  def initialize
    super
    @spots_needed = 1
    @size = :compact
  end
end

class ParkingLot
  def initialize
    @levels = # generate_levels
  end

  def park_vehicle(vehicle)
    # Park the vehicle in a spot or multiple spots. Return false if failed.
  end
end

class Level
  def initialize(floor, num_spots)
    @spots = # generate spots
    @available_spots = num_spots
    @floor = floor
  end

  def park_vehicle(vehicle)
    # Find a place to park vehicle or return false.
  end

  def park_starting_at(spot_num, vehicle)
    # Park a vehicle starting at spot number and continue until vehicle.spots_needed.
  end

  def find_available_spots(vehicle)
    # Find a spot to park the vehicle. Return index of spot or -1.
  end

  def spot_freed
    @available_spots += 1
  end
end

class ParkingSpot
  attr_reader :row, :spot_num

  def initialize(size, level, row, spot_num)
    @vehicle = nil
    @spot_size = size
    @level = level
    @row = row
    @spot_num = spot_num
  end

  def is_free?
    !@vehicle
  end

  def can_fit_vehicle?(vehicle)
    # Check it will fit.
  end

  def park(vehicle)
    # Park in spot
  end

  def unpark
    # Remove vehicle from spot and notify level that a new spot is available.
  end
end


def bfs(&prc)
raise "error" if prc.nil?

    queue = [self]
    until queue.empty?
        node = queue.shift
        return node if prc.call(node)
        queue += node.children
    end
    nil
end


def dfs(target, &prc)
    raise "error" if prc.nil?

    return self if prc.call(self)

    self.children.each do |child|
        searched = child.dfs(target, &prc)
        return searched unless searched.nil?
    end
    nil
end
