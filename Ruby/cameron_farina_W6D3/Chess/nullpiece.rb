require_relative "piece.rb"

class NullPiece < Piece
  #  attr_reader :color, :board, :position

    def initialize(color = nil, board, position)
        # @color = color
        # @board = board
        # @position = position
        super(color, board, position)
    end

    # def moves
    # end

    # def symbol
    # end

end