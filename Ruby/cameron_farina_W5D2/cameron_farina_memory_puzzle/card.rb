class Card
    VALUES = ("a".."z").to_a

    def self.shuffle_pairs
        values = VALUES
        values = values.shuffle.take(8)*2
        values = values.shuffle!
        shuffled_cards = values.map { |card| self.new(card) }
        shuffled_cards
    end

    attr_reader :value
    attr_accessor :revealed

    def initialize(value)
        @value = value
        @revealed = false
        @face_down = " "
        @face_up = value
    end

    def revealed?
        self.revealed
    end
    
    def reveal
        self.revealed = true
    end

    def hide
        self.revealed = false
    end

    def ==(object)
        object.is_a?(self.class) && object.value == value
    end

    def to_s
        self.revealed? ? value : " "
    end
end