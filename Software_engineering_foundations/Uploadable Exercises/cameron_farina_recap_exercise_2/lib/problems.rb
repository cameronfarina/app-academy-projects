# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    max = [num_1, num_2].max
    min = [num_1, num_2].min

    lcms = []
    (1..max).each do |factor|
        lcm = (max * factor)
        if lcm % min == 0
            return lcm
        end
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
   # str.select { |word| str.include?(word) }

def most_frequent_bigram(str)
    count = Hash.new(0)
    (0...str.length-1).each do |i|
       bigram = str[i..i+1] 
       count[bigram] += 1
    end

    sorted = count.sort_by { |k, v| v }
    sorted.last[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        new_hash
    end
end

            #expect([1, 2, 1, 3, 8].pair_sum_count(5)).to eq(1)
            #expect([10, 3, 6, 5, 7].pair_sum_count(13)).to eq(2)
            #expect([10, 3, 6, 5, 7].pair_sum_count(4)).to eq(0)

class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        (0...self.length).each do |idx_1|
           (idx_1 + 1...self.length).each do |idx_2|
                if self[idx_1] + self[idx_2] == num
                    count += 1
                end
           end
        end
        count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }

        sorted = false
        
        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    sorted = false
                    self[i], self[i + 1] = self[i + 1], self[i]
                end
            end
        end
        self
    end
end
