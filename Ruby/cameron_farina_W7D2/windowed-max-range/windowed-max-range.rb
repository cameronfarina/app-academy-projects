# Given an array, and a window size w, find the maximum range 
# (max - min) within a set of w elements.


def windowed_max_range(arr, w)
    current_max_range = 0

    #w = 2
    (0...arr.length).each do |i|
        temp = arr[i...w]
        range = temp.max - temp.min
        if range > current_max_range
            current_max_range = range
        end

        w += 1
    end
    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

# 1. [1 2 3 5], 3== (max - min) = w --> (3 - 1) = 2
# 2. 1 [2 3 5] == (max - min) = w --> (5 - 2) = 3 <-- return the larger answer
