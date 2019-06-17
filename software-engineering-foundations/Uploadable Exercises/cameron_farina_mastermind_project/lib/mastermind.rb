require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length) 
    end

    def print_matches(code)
        puts @secret_code.num_exact_matches(code)
        puts @secret_code.num_near_matches(code)

    end

    def ask_user_for_guess
        puts "Enter a code"
        user_guess = gets.chomp
        new_guess =  Code.from_string(user_guess)
        self.print_matches(new_guess)
        new_guess == @secret_code
    end
end
