require_relative "computer_player"
require_relative "player"

class Board

    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_")}
    end

    def empty?(position)
        row, col = position
        @grid[row][col] == "_"
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, mark)
        row, col = position
        @grid[row][col] = mark
    end

    def place_mark(position, mark)
        if !self[position] == "_"
            raise "This position already has been filled"
        else 
            self[position] = mark
        end
    end

    def winner?(mark)

        @grid.each do |row|
            return true if row == [mark, mark, mark]
        end

        @grid.transpose.each do |col|
            return true if col == [mark, mark, mark]
        end

        return true if self.diagonals[0].all? { |pair| @grid[pair[0]][pair[1]] == mark }
        return true if self.diagonals[1].all? { |pair| @grid[pair[0]][pair[1]] == mark }

        false
    end

    def diagonals
       [[[0,0], [1,1], [2,2]], [[0,2], [1,1], [2,0]]]
    end

    def over?(mark)
        @grid.flatten.none? { |ele| ele.include?("_") } || self.winner?(mark)
    end

end

