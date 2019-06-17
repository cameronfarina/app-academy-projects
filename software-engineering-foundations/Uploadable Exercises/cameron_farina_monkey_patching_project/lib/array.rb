# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length > 0
           return (self.max - self.min)
        end
    end
  
    def average
        if self.length > 0
            self.sum / (self.length * 1.0)
        end
    end
    
    def median
        return nil if self.length == 0
    
        if self.length.odd?
            mid_index = self.length / 2
            before_mid_index = (mid_index - 1)
            self.sort[mid_index]
        else 
            mid_index = self.length / 2
            before_mid_index = (mid_index - 1)
            (self.sort[mid_index] + self.sort[before_mid_index]) / 2.0
        end
    end

    def counts
        count = Hash.new(0)

        self.each { |el| count[el] += 1 }
        return count
    end

    def my_count(val)
        count = Hash.new(0)

        self.each { |el| count[el] += 1 }
        return count[val]
    end

    def my_index(val)
        self.each_with_index do |ele, idx|
           return idx if ele == val
        end
        nil
    end

    def my_uniq
        new_array = []

        self.each do |ele|
            if new_array.include?(ele) == false
                new_array << ele
            end
        end
        new_array
    end

            #col0, #col1, #col2
         # row 0["a", "b", "c"]
         # row 1["d", "e", "f"]
         # row 2["g", "h", "i"]
  

    def my_transpose
        new_array = []

        (0...self.length).each do |row|
            new_row = []

            (0...self.length).each do |col|
               new_row << self[col][row]
               
            end
            new_array << new_row
        end
        new_array
    end





end
