require_relative "card"

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(4) { Array.new(4, " ") }
        self.populate
    end

    def populate
        shuffled = Card.shuffle_pairs
        @grid.length.times do |row|
            @grid.length.times do |col|
                @grid[row][col] = shuffled.pop
            end
        end

    end

    def render    
        card_displays = @grid.map do |row|
            row.map do |card|
                card.to_s
            end
        end

        puts "   #{(0...card_displays.length).to_a.join("  ")}"
        card_displays.each_with_index do |row, i|
            puts "#{i}  #{row.join("  ")}"
        end
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end
   
    def reveal(guessed_position)
        @grid[guessed_position].reveal
    end

    def won?
        @grid.flatten.all? { |card| card.revealed? }
    end
    
end