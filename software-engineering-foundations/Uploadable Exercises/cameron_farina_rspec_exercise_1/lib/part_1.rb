def average(num_1, num_2)
    return (num_1 + num_2) / 2.0
end

def average_array(array)
    array.sum / (array.length * 1.0)
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split
    new_words = words.map.with_index do |word, i|
         if i % 2 == 0
             word.upcase
         else  
            word.downcase
         end
    end

    new_words.join(" ")
end