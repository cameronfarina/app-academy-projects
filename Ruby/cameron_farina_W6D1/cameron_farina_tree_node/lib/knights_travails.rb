#require "byebug"

require_relative "00_tree_node"

class KnightPathFinder
    attr_reader :start_pos
    attr_accessor :root_node, :considered_positions

    MOVES = [
        [-2,-1], 
        [-2, 1], 
        [-1,-2], 
        [-1, 2],
        [1, -2], 
        [1,  2], 
        [2, -1], 
        [2,  1]
    ]

    def self.valid_moves(pos)
        valid_moves = []

        x, y = pos
        MOVES.each do |(mx, my)|
            new_pos = [x + mx, y + my]
            
            if new_pos.all? { |coordinate| coordinate.between?(0,7) }
                valid_moves << new_pos
            end
        end
        valid_moves
    end

    def initialize(start_pos)
        #debugger
        @start_pos = start_pos
        @considered_positions = [start_pos]

        self.build_move_tree
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)
        queue = [root_node]

        until queue.empty?
            current_node = queue.shift
            pos = current_node.value
            self.new_move_positions(pos).each do |new_pos|
            next_node = PolyTreeNode.new(new_pos)
            current_node.add_child(next_node)
            queue << next_node
            end
        end
        
    end

    def new_move_positions(pos)
      KnightPathFinder.valid_moves(pos)
      .reject { |new_pos| @considered_positions.include?(new_pos) }
      .each { |new_pos| @considered_positions << new_pos }
    end
end


p KnightPathFinder.new([0,0])
