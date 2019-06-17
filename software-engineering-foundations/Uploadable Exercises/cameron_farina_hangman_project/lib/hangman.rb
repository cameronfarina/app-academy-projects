class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    new_array = []
    
      @secret_word.each_char.with_index do |c, i|

        if c == char
          new_array << i
        end

      end

    new_array
  end

  def fill_indices(char, indices)
      indices.each do |i|
        guess_word[i] = char
      end

      @guess_word
  end

  def try_guess(char)
    array_of_indices = self.get_matching_indices(char)
    self.fill_indices(char, array_of_indices)
    if array_of_indices.length < 1
      @remaining_incorrect_guesses -= 1
    end


    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      return true
    end
    
  end

  def ask_user_for_guess
    p 'Enter a char'
    char = gets.chomp
    self.try_guess(char) 
  end

  def win?
    if @guess_word.join == @secret_word
      print 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
      false
  end

end

