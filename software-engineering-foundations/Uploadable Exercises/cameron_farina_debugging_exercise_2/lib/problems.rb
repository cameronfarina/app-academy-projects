# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(number)
    largest_prime_factors = []

    (2..number).map { |n| largest_prime_factors << n if number % n == 0 && is_prime?(n) }

    largest_prime_factors.max
end

def is_prime?(number)
    (2...number).each do |n|
      return false if number % n == 0 || number < 2 
    end
    true
end

 def unique_chars?(str)
    count = Hash.new(0)
    str.each_char { |char| return false if ((count[char] += 1) > 1) }

    return true
 end

def dupe_indices(array)
    my_hash = Hash.new { |h, k| h[k] = [] }
    array.each_with_index do |ele, i|
        my_hash[ele] << i
    end
    my_hash.select { |ele, arr| arr.length > 1}
end

def ana_array(arr_1, arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    arr_1.each { |el| hash_1[el] += 1 }
    arr_2.each { |el| hash_2[el] += 1 }

    return true if hash_1 == hash_2

    false
end 