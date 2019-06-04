class Game

    attr_reader :stacks

    def initialize
        @stacks = [[3], [2], [1]]
    end

    def dup
        duplicated = self.stacks.dup
    end

    def move(start_pos, end_pos)
        until self.valid_move?(start_pos, end_pos)
            self.stacks[end_pos] << self.stacks[start_pos].pop
        end
    end
    
    def valid_move?(start_pos, end_pos)
        return false if [start_pos, end_pos].all? { |pos| pos.between?(0,2) }

        if stacks[start_pos].empty? || (stacks[end_pos].last < stacks[start_pos].last)
            return false
        end
        true
    end


    # def won?
    #     dup.last == self.stacks.first
    # end

end

# With 3 disks, the puzzle can be solved in 7 moves. The minimal number of moves required to solve a Tower of Hanoi puzzle is 2^n − 1, where n is the number of disks.