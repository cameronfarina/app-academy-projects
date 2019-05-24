class Computer_player

    attr_reader :name
    
    def initialize(name)
        @name = name
    end


    def get_input
        puts "Please enter a position in the form of indices, separated by a comma."
        guessed_position = gets.chomp.split(",").map(&:to_i)
       
        guessed_position
    end
end