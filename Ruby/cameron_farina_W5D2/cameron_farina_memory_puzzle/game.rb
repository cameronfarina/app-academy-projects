require_relative "board"

class Game

    attr_reader :players

    def initialize(*players)
        @board = Board.new
        @players = players
        @previous_guess = nil
    end

    def guessed_pos
        self.current_player.get_input
    end

    def play
        until @board.won?
            system("clear")
            @board.render
            puts "Make a guess: "
            self.make_guess(guessed_pos)
        end
        puts "The game is over"
    end

    def make_guess(pos)
        until is_valid?(pos)
           pos = self.guessed_pos
        end
        
        if @previous_guess == nil
            @board[pos].reveal
            @previous_guess = pos
        else
            if @board[pos] == @board[@previous_guess]
                system("clear")
                @board[pos].reveal
                @board.render
                puts "it's a match"
                @board[@previous_guess].reveal
                @previous_guess = nil
            else   
                system("clear")
                @board[pos].reveal
                @board.render
                puts "not a match"
                sleep(1)
                @board[pos].hide
                @board[@previous_guess].hide
                @previous_guess = nil
            end
        end
    end

    def is_valid?(guessed_position)
        guessed_position.length == 2 && guessed_position.all? { |pos| pos.between?(0,3) } && !@board[guessed_position].revealed?
    end

    def current_player
        self.players.first
    end

    def next_player!
        self.players.rotate!
    end
end