# Write a method #first_anagram? that will generate and store all the 
# possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

def first_anagram(first, second) # time complexity O(n!) | # space complexity O(n!)
    arr = first.split("")
    
    arr.permutation.to_a
    .map { |subarr| subarr.join('') }
    .include?(second)
end


# Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in 
# the second string (hint: use Array#find_index) and delete at that index. 
# The two strings are anagrams if an index is found for every letter and the 
# second string is empty at the end of the iteration.

# Try varying the length of the input strings. 
#What are the differences between #first_anagram? and #second_anagram??

def second_anagram(first, second) # time O(n^2) | # space complexity O(n)
    second_array = second.split("")

    first.each_char.with_index do |char, i|
        index = second_array.index(char)
        return false if index.nil?
        second_array.delete_at(index)
    end
    second_array.empty?
end

def third_anagram(first, second) # O(n log(n)) | # space complexity O(n)
    first.split("").sort == second.split("").sort
end




# Write one more method #fourth_anagram?. This time, use two Hashes to store 
# the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.
def fourth_anagram(first, second) # time complexity O(n) | # space complexity O(1)
    hash = Hash.new { |h, k| h[k] = 0 }
   
    first.each_char do |c1|
        hash[c1] += 1
    end

    second.each_char do |c1|
        hash[c1] -= 1
    end

    hash.values.all? {|val| val == 0}
end

p first_anagram("elvis", "lives")
p second_anagram("elvis", "lives")
p third_anagram("elvis", "lives")
p fourth_anagram("elvis", "lives")