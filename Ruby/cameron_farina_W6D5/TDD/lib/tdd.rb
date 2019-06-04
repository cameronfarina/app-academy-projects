class Array
    
    def my_uniq
        dups = []
        self.each do |ele|
            dups << ele if !dups.include?(ele)
        end
        dups
    end

    def two_sum
        pairs = []

        (0...self.length).each do |i|
            (i+1...self.length).each do |j|
                pairs << [i, j] if self[i] + self[j] == 0
            end
        end
        pairs
    end

    def my_transpose
        row_length = self.first.count
        transpose = Array.new(row_length) {Array.new(row_length)}

        row_length.times do |i| 
            row_length.times do |j|
               transpose[j][i] = self[i][j]
            end
        end
        transpose
    end

end

def stock_picker(array)
    profit = 0
    days = []
    array.length.times do |i|
        (i + 1...array.length).each do |j|
            amount = (array[j] - array[i])
            if profit < amount
                profit = amount
                days = [i, j]
            end
        end
    end
    days
end
