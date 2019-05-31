require_relative "piece"
require_relative "nullpiece"
require_relative "cursor"
# require "byebug"
class Board

    attr_reader :grid, :position

    def self.create_board
        Array.new(8) { Array.new(8, " ") }
    end

    def initialize(grid = Board.create_board)
        @grid = grid
        self.populate
    end

    def populate
        (0..7).each do |row|
            (0..7).each do |col|

            color = :W if row == 0 || row == 1

            color = nil if row == 2 || row == 3 || row == 4 || row == 5
                    
            color = :B if row == 6 || row == 7
              
                @grid[row][col] = Piece.new(color, self, [row, col]) if row == 0 || row == 1 || row == 6 || row == 7
                @grid[row][col] = NullPiece.new(color, self, [row, col]) if row == 2 || row == 3 || row == 4 || row == 5
            end
        end
        @grid
    end

    def move_piece(start_pos, end_pos)
        raise "there is no piece here" if self[start_pos].is_a?(NullPiece)
        raise "this piece cannot be moved here" if !self[end_pos].is_a?(NullPiece)
        starting_position_board = self[start_pos]
        ending_position_board = self[end_pos]
              
        self[end_pos] = starting_position_board
        self[end_pos].position = end_pos
        self[end_pos]
        self[start_pos] = ending_position_board
        self[start_pos].position = start_pos
        self[start_pos]

        self
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, piece)
        row, col = position
        @grid[row][col] = piece
    end

    def valid_pos?(position)
        position.all? { |space| space.between?(0,7) } && 
        (@board[position].enemy?(position) || @board[position].is_a?(NullPiece))
    end

end




# num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))