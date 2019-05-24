require_relative "game"
require_relative "player"
require "set"


class Ai_Player
    attr_reader :name

    def initialize(name)
        @name = name
        @dictionary = Set.new(File.readlines("dictionary.txt").map(&:chomp))
    end

    def isAI?(player)
        return true
    end
    
    def get_move(fragment, num_players)
        
        alphabet = ("a".."z").to_a
        potential_guesses = []
        found_winning_letter = false
        guess = ''

        i = 0

        while i < alphabet.length
            current_letter = alphabet[i]
            
            if self.valid_play?(current_letter, fragment)

                if self.is_winning_letter?(current_letter, fragment, num_players)
                    guess += current_letter
                    found_winning_letter = true
                    break
                else
                    potential_guesses << current_letter
                end

            end

            i += 1
        end

        if found_winning_letter == false
            scrambled_potential_guesses = potential_guesses.shuffle
            i = 0

            while i < potential_guesses.length
                current_letter = scrambled_potential_guesses[i]

                if !self.is_losing_letter?(current_letter, fragment)
                    guess += current_letter
                    break
                elsif i == potential_guesses.length - 1
                    guess += current_letter
                    break
                end
    
                i += 1
            end
        end  

        guess
    end

    def valid_play?(letter, fragment)
        @dictionary.any? { |word| word.start_with?(fragment + letter) }
    end

    def is_winning_letter?(letter, fragment, num_players)
      new_fragment = fragment + letter

      @dictionary.all? { |word| word.start_with?(new_fragment) && (word.length - new_fragment.length) <= num_players }
    end

    def is_losing_letter?(letter, fragment)
        new_fragment = fragment + letter
        @dictionary.include?(new_fragment)
    end

end