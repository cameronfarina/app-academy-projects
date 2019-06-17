class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def display(board)
        puts "   0 1 2"
        board.grid.each_with_index { |row, i| puts "#{i}  #{row.join(" ")}\n" }
    end

    def get_move(mark)
        position = gets.chomp.split(",").map(&:to_i)
    end
end