require_relative "tiles"
require "colorize"

class Board

    def self.from_file(file_name)
        grid = Array.new(9) { Array.new(9) { Tile.new(" ") } }

        sudoku_pattern = File.readlines(file_name).map(&:chomp)
        grid.each_index do |i|
            grid.each_index do |j|
                val = sudoku_pattern[i][j].to_i
                if val != 0
                    grid[i][j] = Tile.new(val)
                end
            end
        end
        
        Board.new(grid)
    end

    attr_reader :grid

    def initialize(grid)
        @grid = grid
    end

    def render
        puts "  #{(1..9).to_a.join(" ")}".yellow
        @grid.each_with_index do |row, i|
            print "#{i+1} ".yellow
            row.each do |tile|
                if tile.given_value?
                    print "#{tile.value} ".red
                else
                    print "#{tile.value} ".blue
                end
            end
            print "\n"
        end
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        tile = @grid[row][col]
        tile.value = value
    end

    def board_filled_out?
        @grid.none? { |el| el == " " }
    end

end

