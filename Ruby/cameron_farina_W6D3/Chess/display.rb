require "colorize"
require_relative "cursor"
require_relative "board"
require_relative "piece"
#require "byebug"

class Display

    attr_reader :board, :cursor, :notifications
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @notifications = {}
    end

    def render
        outer = []
        (0...self.board.grid.length).each do |i|
            inner = []
            (0...self.board.grid.length).each do |j|
                if self.board[[i, j]].is_a?(Piece)
                    # inner << "  ".colorize(:background => :black ) if (i + j).even?
                    inner << self.board[[i, j]].symbol.colorize(:color => :white, :background => :black ) if (i + j).even?
                    inner << self.board[[i, j]].symbol.colorize(:color => :black,:background => :white ) if (i + j).odd?
                else
                    inner << "  ".colorize(:background => :black ) if (i + j).even?
                    inner << "  ".colorize(:background => :white ) if (i + j).odd?
                end
            end
            outer << inner
        end
        outer.map { |inner| puts inner.join("") }
    end


    def build_grid
        @board.grid.map.with_index do |row, i|
            build_row(row, i)
        end
    end

    def build_row(row, i)
        row.map.with_index do |piece, j|
            color_options = colors_for(i, j)
            piece.to_s.colorize(color_options)
        end
    end

end

#  def render
#         system("clear")
#         puts "Arrow keys, or WASD to move, space or enter to confirm"

#         build_grid.each { |row| puts row.join }

#         @notifications.each do |key, val|
# end
