class Piece
    attr_reader :color, :board
    attr_accessor :position
    def initialize(color = nil, board, position)
        @color = color
        @board = board
        @position = position

        board.add_piece(self, position)
    end

    def to_s
        " #{symbol} "
    end

    def empty?
        false
    end

    def enemy?(position)
        return false unless self.color != @board[position].color
        true
    end

    def valid_moves
        moves(move_direction)
    end

    def pos=(val)
    end

    def symbol
        # puts "♜"
        # #♜♘♟♔♕♗♙♞♝♜♛♚
    end

    private
    def move_into_check?(end_pos)
    end
end


