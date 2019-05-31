require_relative "piece.rb"

class NullPiece < Piece
  include Singleton

    attr_reader :color

    def initialize
        @color = nil
    end

    def empty?
       true
    end

    def valid_moves
       []
    end

    def symbol
        " "
    end

end