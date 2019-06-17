class Room
    attr_reader :capacity, :occupants
    def initialize(number)
        @capacity = number
        @occupants = []
    end

    def full?
       return false if occupants.length < capacity
       true
    end

    def available_space
        return capacity - occupants.length 
    end

    def add_occupant(person)
        if self.full? == false
            occupants << person
            return true
        end
        false
    end

end
