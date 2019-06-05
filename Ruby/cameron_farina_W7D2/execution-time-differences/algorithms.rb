# my_min
# Given a list of integers find the smallest number in the list.


# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
def my_min_phase_i(arr)
    min_val = arr.first
    (0...arr.length).each do |i|
        (i + 1...arr.length).each do |j|
            min_val = arr[i] if arr[i] < arr[j] && arr[i] < min_val
        end
    end
    min_val
end

# Time (n^2)

# Example:

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_phase_i(list)  # Time complexity = O(n)
# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?
def my_min_phase_ii(arr)
    min_val = arr.first
    (0...arr.length - 1).each do |i|
        min_val = arr[i] if arr[i] < arr[i + 1] && arr[i] < min_val
    end
    min_val
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_phase_ii(list)  

# Largest Contiguous Sub-sum
def contiguous(arr) # Time complexity = 0(n^4)
    sub_arrays = []
    max = 0
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            sub_arrays << arr[i..j]
            sub_arrays.each do |sub|
                max = sub.sum if sub.sum > max
            end
        end
    end
    max
end


list = [2, 3, -6, 7, -6, 7]
# p contiguous(list) # => 8


# possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7


def contiguous_2(arr) # Time complexity = 0(n)
    # return arr.max if arr.all? {|el| el < 0}
    max = arr.first
    temp = arr.first

    (1...arr.length).each do |i|
        temp = 0 if temp < 0
        temp += arr[i]
        max = temp if temp > max
    end

   max
end

p contiguous_2(list)