# encoding: UTF-8
# Write a method no_dupes?(arr) that accepts an array as an arg and 
# returns a new array containing the elements that were not repeated in 
# the array.
def no_dupes?(arr)
    uniques = []
    
    arr.each { |el| uniques << el if !uniques.include?(el) && arr.count(el) == 1 }

    return uniques
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


# Write a method no_consecutive_repeats?(arr) that accepts an array as an 
# arg. The method should return true if an element never appears 
# consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each { |i| return false if arr[i] == arr[i + 1] }

    return true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


# Write a method char_indices(str) that takes in a string as an arg. The 
# method should return a hash containing characters as keys. The value 
# associated with each key should be an array containing the indices 
# where that character is found.

def char_indices(str)
    indices = Hash.new { |hash, k| hash[k] = [] }

    str.each_char.with_index { |char, idx| indices[char] << idx }

    return indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


# Write a method longest_streak(str) that accepts a string as an arg. The 
# method should return the longest streak of consecutive characters in 
# the string. If there are any ties, return the streak that occurs later 
# in the string.

def longest_streak(str)
    counts = Hash.new(0)
    streak = ''

    str.each_char { |char| counts[char] += 1 }

    new_hash = counts.sort_by { |k, v| v }

    number_of_times = counts.values.sort.last

    number_of_times.times { streak << new_hash.last[0] }

    return streak
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


# Write a method bi_prime?(num) that accepts a number as an arg and 
# returns a boolean indicating whether or not the number is a bi-prime. A 
# bi-prime is a positive integer that can be obtained by multiplying two 
# prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def is_prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end

def bi_prime?(num)
    factors = []
    prime_factors = []

    (2...num).each do |factor|
        if num % factor == 0
            factors << factor
        end
    end
    
    factors.each do |each_num|
        if is_prime?(each_num)
            prime_factors << each_num
        end
    end

    prime_factors.each do |el|
        prime_factors.each do |el_2|
           return true if el * el_2 == num
        end
    end
    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


# A Caesar cipher takes a word and encrypts it by offsetting each letter 
# in the word by a fixed number, called the key. Given a key of 3, for 
# example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a 
# sequence of keys is used. For example, if we encrypt "bananasinpajamas" 
# with the key sequence 1, 2, 3, then the result would be 
# "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t

# Write a method vigenere_cipher(message, keys) that accepts a string and 
# a key-sequence as args, returning the encrypted message. Assume that 
# the message consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to
    cipher = ""
   
    message.each_char.with_index do |char, idx|
        old_pos = alphabet.index(char)
        new_pos = (old_pos + keys[idx % keys.length]) % 26
        cipher += alphabet[new_pos]
    end
    return cipher
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"

# Write a method vowel_rotate(str) that accepts a string as an arg and 
# returns the string where every vowel is replaced with the vowel that 
# appears before it sequentially in the original string. The first vowel 
# of the string should be replaced with the last vowel.vowles 

def vowel_rotate(str)
    vowels = ["a", "e", "i", "o", "u"]
    rotated_word = ""
    arr = []

    str.each_char do |char|
        if vowels.include?(char)
            if arr.empty?
                arr << char
                char = last_vowel_found(str)
                rotated_word += char
            else 
                arr << char
                char = arr.first
                arr.shift
                rotated_word += char
            end
        else
            rotated_word += char
        end
    end
    return rotated_word
end

def last_vowel_found(str)
    vowels = ["a", "e", "i", "o", "u"]
    
    (str.length.downto(0)).each { |idx| return str[idx] if vowels.include?(str[idx]) }
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


# Extend the string class by defining a String#select method that accepts 
# a block. The method should return a new string containing characters of 
# the original string that return true when passed into the block. If no 
# block is passed, then return the empty string. Do not use the built-in 
# Array#select in your solution.

class String
    def select(&prc)
        new_str = ""
        prc ||= Proc.new { |char| char == "" }

        self.each_char do |char|

            if prc.call(char)
                new_str += char
            end
            
        end

        new_str
    end

#     # Extend the string class by defining a String#map! method that accepts a 
#     # block. The method should modify the existing string by replacing every 
#     # character with the result of calling the block, passing in the original 
#     # character and it's index. Do not use the built-in Array#map or 
#     # Array#map! in your solution.

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            if prc.call(char, idx)
                self[idx] = prc.call(char, idx)
            end
        end
        self
    end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLO world".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


# # Write a method multiply(a, b) that takes in two numbers and returns 
# # their product.

# # You must solve this recursively (no loops!)
# # You must not use the multiplication (*) operator

def multiply(a, b)
    min = [a, b].min
    max = [a, b].max

    return 0 if min == 0 || max == 0
    return max if min == 1
    return min if max == 1

    if max < 0 && min < 0
        max.abs + multiply(min + 1, max)
    elsif min < 0 && max > 0
        multiply(min + 1, max) - max
    else
        max + multiply((min % max) - 1, max) 
    end
end                

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


# The Lucas Sequence is a sequence of numbers. The first number of the 
# sequence is 2. The second number of the Lucas Sequence is 1. To 
# generate the next number of the sequence, we add up the previous two 
# numbers. For example, the first six numbers of the sequence are: 
# 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a 
# length as an arg. The method should return an array containing the 
# Lucas Sequence up to the given length. Solve this recursively.


def lucasSequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2

    lucasSequence(length - 1) << lucasSequence(length - 1).last + lucasSequence(length - 2).last
        
end

p lucasSequence(0)   # => []
p lucasSequence(1)   # => [2]    
p lucasSequence(2)   # => [2, 1]
p lucasSequence(3)   # => [2, 1, 3]
p lucasSequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucasSequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


# The Fundamental Theorem of Arithmetic states that every positive 
# integer is either a prime or can be represented as a product of prime 
# numbers.

# Write a method prime_factorization(num) that accepts a number and 
# returns an array representing the prime factorization of the given 
# number. This means that the array should contain only prime numbers 
# that multiply together to the given num. The array returned should 
# contain numbers in ascending order. Do this recursively.

def prime_factorization(num)
    return [num] if is_prime?(num)
 
    arr = prime_factorization(num / prime_factors(num)[0]).unshift(prime_factors(num)[0])

end

def prime_factors(num)
    factors = []
    (2...num/2).each do |factor|
        if is_prime?(factor) && num % factor == 0
            factors << factor
        end
    end
    factors
end

def is_prime?(num)
    return false if num < 2
    (2..num/2).none? { |fac| num % fac == 0 }
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]


# # method_1
#  def prime_factorization(num)
#     return [num] if is_prime?(num)
 
#     arr = prime_factorization(num / prime_factors(num)[0]).unshift(prime_factors(num)[0])

# end

# #method_2
# def prime_factorization(num)
#     return [num] if is_prime?(num)

#     if !prime_factors(num).inject(:*) == num
#         return [prime_factors(num)[0]]
#     end

#     arr = prime_factorization(num / prime_factors(num)[0]).unshift(prime_factors(num)[0])
# end