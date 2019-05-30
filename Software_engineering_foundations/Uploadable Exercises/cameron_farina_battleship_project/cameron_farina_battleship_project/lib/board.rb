class Board  
attr_reader :size

    def self.print_grid(grid)
        grid.map do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = (n * n)
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count { |el| el == :S }
    end

    def attack(position)
        row, col = position
        if self[position] == :S
            self[position]= :H
            p 'you sunk my battleship'
            return true
        else 
            self[position]= :X
            return false
        end
    end
 
    def place_random_ships
        randomly_placed_ships = self.size * 0.25

        until num_ships == randomly_placed_ships
            random_row = rand(0...@grid.length)
            random_col = rand(0...@grid.length)
            self[[random_row, random_col]]= :S         
        end
        
    end

    def hidden_ships_grid
        outside_array = @grid.map do |row|
           inside_array = row.map do |el|
                if el == :S 
                    :N
                else  
                    el
                end
           end
        end
        
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end

