require_relative "player"
require_relative "ai_player"

require "set"

class Game
    @@LOSING_WORD = "GH"

    attr_reader :players, :fragment

    def initialize(*players)
        @players = players
        @score = {}
        @fragment = ""
        @players_who_have_been_eliminated = []
        @dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))
    end

    def create_player_standings
        @players.each { |player| @score[player] = "" }
    end

    def start_the_game
        self.randomize_players
        self.create_player_standings
        until self.game_is_over?
            self.play_round
        end
        puts "The game is over, #{current_player.name} has won the game!"
    end

    def play_round
        self.reset_fragment
        puts "Here are the current standings: #{self.display_standings}", ""
        puts "Here are the players who have been eliminated: #{self.display_eliminated_players}", ""

        until self.fragment_is_complete?
            self.take_turn(self.current_player)
        end 

        self.update_scores(self.current_player)
        if @score[self.current_player] == @@LOSING_WORD
            puts "#{self.current_player.name} has been eliminated from the game."
            @players_who_have_been_eliminated << self.current_player
            @players.delete(self.current_player)
        end
        self.display_standings
        self.next_player!
    end
    
    def randomize_players
        rand(0...@players.length).times { @players.rotate! }
    end

    def reset_fragment
        @fragment = ""
        puts "We're starting a new round! #{self.current_player.name}, please start the round by choosing the first letter of the new fragment!", ""
    end

    def update_scores(player)
        @score[player] += @@LOSING_WORD[@score[player].length]
    end
    
    def take_turn(player)
        puts "#{player.name} please make a guess"
        puts "The current fragment is: " + @fragment, ""

        guess = player.get_move(fragment, num_players)

        until valid_play?(guess)
            puts "That guess is invalid, please try again."
            guess = player.get_move(fragment, num_players)
        end
        
        @fragment += guess
        
        if self.fragment_is_complete?
            self.round_is_over
        else
            puts "#{player.name} has guessed " + guess
            puts "The fragment is now: " + @fragment, ""
            self.next_player!
            puts "\n\n" 
        end
    end

    def display_players
        @players.map { |player| player.name }
    end

    def display_eliminated_players
        @players_who_have_been_eliminated.map { |loser| loser.name }
    end

    def round_is_over
        puts "#{self.current_player.name} has lost the round by spelling", fragment, ""
    end

    def num_players
        @players.length
    end

    def current_player
        @players.first
    end

    def previous_player
        @players.last
    end
    
    def next_player!
        @players.rotate!
    end

    def losing_player
        @players_who_have_been_eliminated.last
    end

    def valid_play?(guess)
        @dictionary.any? { |word| word.start_with?(@fragment + guess) } && guess.length == 1
    end

    def fragment_is_complete?
        @dictionary.include?(fragment)
    end

    def display_standings
        standings = {}
        @score.each { |player, score| standings[player.name] = score }
        standings
    end

    def game_is_over?
        @players.length == 1
    end
    
end
