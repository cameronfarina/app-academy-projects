class Computer

    attr_reader :name

    def initialize(name)
        @name = name
        @board = nil
    end

    def display(board)
        @board = board
    end

    def get_move(mark)
        (0..2).each do |i|
            (0..2).each do |j|
                position = [i, j]
                if @board.empty?(position)
                    @board[position] = mark 
                    if @board[position] == @board.winner?(mark)
                        return [i, j]
                    else 
                        @board[position] = "_"
                    end
                end
            end
        end


        loop do
            position = [rand(0..2), rand(0..2)]
            if @board.empty?(position)
                return position 
            end   
        end
    end
end


