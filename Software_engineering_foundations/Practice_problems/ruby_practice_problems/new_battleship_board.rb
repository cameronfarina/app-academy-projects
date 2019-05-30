class Grid
    attr_reader :size

    # Init a grid by its size (the number of squares/cells on a side)
    def initialize(size = 10)
        @size = size
        @ship_squares = []
        @squares = Array.new(size) do |y|
            Array.new(size) { |x| Square.new(self, x, y) }
        end
    end

    # Get a grid square by is x, y coordinates. Returns nil if the
    # coordinates are out-of-bounds
    def [](x,y)
        return nil unless (0...size).cover?(x)
        return nil unless (0...size).cover?(y)
        @squares[y][x]
    end

    # Get (horizontally or vertically) contiguous spans of free squares,
    # i.e. squares that are unoccupied and whose neighbors are unoccupied
    def free_squares
        free_chunks(@squares) + free_chunks(@squares.transpose)
    end

    # Randomly place a ship. This'll raise an error if there's no room left
    # for the ship.
    def place_ship(size)
        span = free_squares.select { |span| span.count >= size }.sample
        raise "We're getting crowded here" unless span
        offset = rand(0..span.count - size)
        @ship_squares << span.slice(offset, size)
        @ship_squares.last.each { |cell| cell.ship = size }
    end

    # Get an array of ship-coordinate-sets; useful for creating easily-parsable
    # output
    def ship_coordinates
        @ship_squares.map do |squares|
            squares.map { |square| [square.x, square.y] }
        end
    end

      # For pretty-printing the grid
      def to_s
        @squares.map do |row|
          row.map(&:to_s).join(" ")
        end.join("\n")
      end

      private

      # Helper method for #free_squares
      def free_chunks(grid)
        grid.flat_map do |row|
          row.chunk(&:free?).select(&:first).map(&:last)
        end
      end
    end

    # A grid square
    class Square

      attr_reader :x, :y
      attr_accessor :ship

      # Init a square with the grid object it belongs to, and its x, y coordinates
    def initialize(grid, x, y)
        @grid = grid
        @x = x
        @y = y
        @ship = nil
    end

      # Is there a ship on this square?
    def blank?
        ship.nil?
    end

      # Is this square and its neighbors unoccupied?
    def free?
        blank? && neighbors.all?(&:blank?)
    end

      # This square's horizontal, vertical, and diagnoal neighbors
    def neighbors
        @neighbors ||= [-1, 0, 1].repeated_permutation(2).map do |dx, dy|
        @grid[x + dx, y + dy] unless dx.zero? && dy.zero?
        end.compact
    end

    def to_s
        blank? ? "·" : ship.to_s # note: using unicode character
    end
    end
end