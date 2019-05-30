require_relative "board"
require_relative "player"


class Battleship

    attr_reader :board, :player

    def initialize(length_of_board)
        @player = Player.new
        @board = Board.new(length_of_board)
        @remaining_misses = (@board.size / 2.0)
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print 'you lose'
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            print 'you win'
            return true
        end
        false
    end
    
    def game_over?
        win? || lose?
    end

    def turn
       if !@board.attack(@player.get_move)
        puts "remaining misses #{@remaining_misses -= 1}"
       end
       @board.print
    end

end
