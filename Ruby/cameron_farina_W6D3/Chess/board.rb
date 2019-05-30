require_relative "piece"
require_relative "nullpiece"
class Board

    attr_reader :grid, :board

    def self.create_board
        grid = Array.new(8) { Array.new(8, " ") }
        (0..7).each do |row|
            (0..7).each do |col|

            color = :W if row == 0 || row == 1

            color = nil if row == 2 || row == 3 || row == 4 || row == 5
                    
            color = :B if row == 6 || row == 7
              
                grid[row][col] = Piece.new(color, self, [row, col]) if row == 0 || row == 1 || row == 6 || row == 7
                grid[row][col] = NullPiece.new(color, self, [row, col]) if row == 2 || row == 3 || row == 4 || row == 5
            end
        end
        grid
    end

    def initialize
        @board = Board.create_board
    end

    def move_piece(start_pos, end_pos)
        (0..7).each do |row|
            (0..7).each do |col|

            end
        end

    end

    def [](position)
        row, col = position
        grid[position]
    end

    def []=(position, piece)
        row, col = position
        grid[position] = piece
    end

end