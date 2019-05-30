class Player
    def get_move
        p "enter a position with coordinates separated with a space"
        user_input = gets.chomp
        array = user_input.split
        array.map(&:to_i)
    end
end

