def rec_range(start_num, end_num)
    return [] if end_num < start_num
    return [start_num] if start_num == end_num - 1
    [start_num] + range(start_num + 1, end_num)
end

def iterative_range(start_num, end_num)
    (start_num...end_num).to_a
end

def exponentiation_1(base, power)
    return 1 if power == 0

    base * exponentiation_1(base, power - 1)

end

def exponentiation_2(base, power)

    return 1 if power == 0
    return base if power == 1
    even_power = power / 2

    if power.even?
        return exponentiation_2(base, even_power) * exponentiation_2(base, even_power)
    else
        exponentiation_2(base, power - 1) + exponentiation_2(base, even_power) * exponentiation_2(base, even_power)
    end
end

class Array
    def deep_dup
        new_array = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_array << ele.deep_dup
            else
                new_array << ele
            end
        end
        new_array
    end
end

def rec_fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    
    rec_fibonacci(n - 1) << rec_fibonacci(n - 1)[-1] + rec_fibonacci(n - 1)[-2]
end

def itr_fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    
    new_arr = [0, 1]

    until new_arr.length == n do
        a = new_arr[-2]
        b = new_arr[-1]
        new_arr << (a + b)
    end
    new_arr
end

def bsearch(array, target)
    return nil if array.empty?
    middle_index = array.size / 2
    return middle_index if array[middle_index] == target
    return nil if array.length == 1 && array[0] != target
    
    if target > array[middle_index]
        bsearch(array[middle_index + 1..-1], target) + middle_index + 1
    else
        bsearch(array[0...middle_index], target)
    end
end

class Array
    def merge_sort(&prc)
        return self if self.length <= 1
        middle_index = self.length / 2
        left = self[0...middle_index]
        right = self[middle_index..-1]

        merge(left.merge_sort, right.merge_sort)
        
    end

    def merge(left, right)
        new_array = []
        prc ||= Proc.new { |a, b| a <=> b }
        
        until left.empty? || right.empty?
            if prc.call(left.first, right.first) == -1
                new_array << left.shift
            else
                new_array << right.shift
            end
        end
        new_array + left + right
    end
end