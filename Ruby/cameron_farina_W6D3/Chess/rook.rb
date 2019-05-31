require_relative "piece"
require_relative "Slideable"
class Rook < Piece
    include Slideable

    def initialize(color, board, position)
         super(color, board, position)
    end

    def symbol
        color == :W ? puts "♜" : puts "♖"
    end

    def move_direction
        H_AND_V
    end

    def move_dirs
        h_and_v
    end

end