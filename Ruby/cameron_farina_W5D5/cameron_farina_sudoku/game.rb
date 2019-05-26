require_relative "board"

class Game

    attr_reader :board

    def initialize(file_name)
        @board = Board.from_file(file_name)
        # just this last part to kind of figure out
    end

    def run
        until board.solved?
            board.render
            self.play
        end
        puts "Congrats you've solved the puzzle!"
    end

    def play
        until board.board_filled_out?
            pos = board.get_pos
            val = board.get_val
            board[pos] = val 
        end
    end

    def get_pos
        pos = gets.chomp.split(",").map.(&:to_i)
        puts "Please enter a position on the board (e.g., '2,2')"
        self.get_pos until valid_pos?(pos)
        pos
    end

    def get_val
        val = gets.chomp
        puts "Please enter a value between 1 and 9"
        self.get_val until valid_val?(val)
        val
    end

    def valid_pos?(pos)
        pos.length == 2 && pos.all { |num| num.between(1,9) }
    end

    def valid_val?(val)
        val.length == 1 && val.between(1,9)
    end
end

game = Game.new("sudoku2.txt")
