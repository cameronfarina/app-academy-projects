require_relative "board"
require_relative "player"



class Battleship

    attr_reader :player, :board
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose'
            return true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        else 
            return false
        end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
       users_move = @player.get_move
        if !@board.attack(users_move)
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end
end


