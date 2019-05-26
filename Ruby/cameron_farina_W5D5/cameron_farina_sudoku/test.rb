# sudoku_pattern = [
#     [200080300],
#     [060070084],
#     [030500209],
#     [000105408],
#     [000000000],
#     [402706000],
#     [301007040],
#     [720040060],
#     [004010003]
# ]


sudoku_pattern = File.readlines("sudoku2.txt").map(&:chomp)
# p sudoku_pattern.each_index { |i| sudoku_pattern[i].to_i }
p sudoku_pattern
# p File.readlines("sudoku2.txt")

p sudoku_pattern[0][3].to_i

# str = "0002044103405"
# p str.to_i



@board.each_index do |i|
    @board.each_index do |j|
        val = sudoku_pattern[i][j].to_i
        @board[i][j] = Tile.new(val)
    end
end