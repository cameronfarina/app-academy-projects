
class Tile

    attr_reader :value
    
    def initialize(value)
        @value = value
        @value != " " ? @given_value = true : @given_value = false
    end

    def given_value?
        @given_value
    end

    def value=(new_val)
        if self.given_value?
            puts "You can't change given values"
        else
            @value = new_val
        end
    end

end