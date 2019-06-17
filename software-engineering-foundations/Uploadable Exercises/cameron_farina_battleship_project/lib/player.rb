require_relative "board"
require_relative "battleship"

class Player
   
    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        user_input = gets.chomp.split.map(&:to_i)
    end 
end