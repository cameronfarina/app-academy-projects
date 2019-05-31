module Slideable

    DIAGONAL = [[1, 1], [1, -1], [-1, -1], [-1, 1]].freeze
    H_AND_V = [[-1, 0], [1, 0], [0, 1], [0, -1]].freeze

    def moves(move_direction) #takes in a direction array Piece#move_dirs
        moves = []
        continue = 
        
        directions.each do |dir|
            current_pos = @position
            # moves << [@position[0] + dir[0], @position[1] + dir[1]] if @board.valid_pos?(@board@position[0] + dir[0], @position[1] + dir[1]])
            while @board.valid_pos?[current_pos[0] + dir[0], current_pos[1] + dir[1]]
                moves << [current_pos[0] + dir[0], current_pos[1] + dir[1]]
                current_pos = [current_pos[0] + dir[0], current_pos[1] + dir[1]]
            end
            current_pos = @position
        end

    end


    def h_and_v
        H_AND_V
    end

    def diagonal
        DIAGONAL
    end

end



# def bfs(direction)
#     queue = [cur_pos]
#     until queue.empty?
#         el = queue.shift
#         el.children.each { |child| queue << child}
#     end

# end 


def moves(position)
    x, y = position
    possible_moves = []
    H_AND_V.each do |new_x, new_y|
        (1..7).each do |i|
           final_x, final_y = x + (i * new_x), y + (i * new_y)
           new_position = [final_x, final_y]
           break unless valid_pos?(new_position)
            if board.empty?(new_position)
                possible_moves << new_position
            else
                possible_moves << new_position if board[new_position].color != color
                break
            end
        end
    end
    possible_moves
end