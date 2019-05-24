require_relative "game"
require_relative "player"

class Player
    
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def get_move(fragment, num_players)
        puts "Please enter a letter as your guess."
        guess = gets.chomp.downcase
        guess
    end

end