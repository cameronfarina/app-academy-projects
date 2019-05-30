require "byebug"

def select_even_nums(array)
    array.select(&:even?)
end 

def reject_puppies(array)      
    array.reject { |h| h["age"] < 3 }
end

def count_positive_subarrays(array)
    array.count { |ele| ele.sum > 0}
end

def aba_translate(str)
    vowels = "aeiou"
    new_word = ""

    str.each_char do |char|
        if vowels.include?(char)
            transformed_char = char + "b" + char
            new_word += transformed_char
        else  
            new_word += char
        end
    end
    new_word
end

def aba_array(array)
    new_array = array.map { |word| aba_translate(word) }
    return new_array
end