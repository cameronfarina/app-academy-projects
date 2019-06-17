require_relative "player"
require_relative "computer_player"
require_relative "board"
class Game

    attr_reader :name, :mark

    def initialize(n, *players)
        @board = Board.new(n)
        @players = players
        @marks = ["X", "O"]
    end

    def current_player
        @players.first
    end

    def current_mark
        @marks.first
    end

    def switch_player!
        @players.rotate!
    end
    
    def switch_marks!
        @marks.rotate!
    end

    def play
        while !@board.over?(self.current_mark)
            self.play_turn
        end
        puts "#{current_player.name} has won the game"
        self.current_player.display(@board)
    end

    def play_turn
        self.current_player.display(@board)
        puts "#{current_player.name}, please enter two numbers separated by a comma."
        position = self.current_player.get_move(self.current_mark)
        p position
        if valid_move?(position)
            @board.place_mark(position, self.current_mark)
            if @board.winner?(self.current_mark)
                return
            end
            self.switch_marks!
            self.switch_player!
        else 
            puts "That was not a valid move, please try again."
            self.play_turn
        end
    end

    def valid_move?(position)
       position.length == 2 && @board[position] == "_" && position.all? { |num| num.between?(0,2) }
    end
    
end