class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.random(length)
    pegs_array = []
    length.times { pegs_array << POSSIBLE_PEGS.keys.sample }
    Code.new(pegs_array)
  end

  def self.valid_pegs?(array_of_chars)
    array_of_chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(array_of_chars)
    if Code.valid_pegs?(array_of_chars)
      @pegs = array_of_chars.map { |chars| chars.upcase }
    else  
      raise "error"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
        if guess[i] == @pegs[i]
          count += 1
        end
    end
      count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if guess[i] != @pegs[i] && self.pegs.include?(guess[i])
        count += 1
      end
    end
    count
  end

  def ==(guess)
    return true if guess == self.pegs
    false
  end

end
