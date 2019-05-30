class GuessingGame

    attr_reader :num_attempts
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            p 'you win'
            @game_over = true
        elsif   num < @secret_num
            p 'too small'
        else
            p 'too big'
        end
    end

    def ask_user
        p 'enter a number'
        users_number = gets.chomp.to_i

        self.check_num(users_number)

    end

end
