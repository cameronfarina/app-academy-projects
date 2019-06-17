def partition(array, num)
    small_array = []
    large_array = []

    array.each do |ele|
        if ele < num
            small_array << ele
        elsif ele >= num
            large_array << ele
        end
    end
    [small_array, large_array]
end

def merge(hash_1, hash_2)
    new_hash = {}
    
    hash_1.each { |k, v| new_hash[k] = v }
    hash_2.each { |k, v| new_hash[k] = v}
    new_hash
end

def censor(sentence, array)
    words = sentence.split

   censored_words = words.map do |word|
        if array.include?(word.downcase)
            swear_word?(word)
        else
            word
        end
    end
    censored_words.join(" ")
end

def swear_word?(str)
    vowels = "aeiou"
    new_string = ""

    str.each_char do |char|
        if vowels.include?(char.downcase)
            new_string += "*"
        else  
            new_string += char
        end
    end
    new_string
end

def power_of_two?(n)
   return true if n == 1
   return false if n == 0 || n % 2 != 0

   power_of_two?(n / 2)
end