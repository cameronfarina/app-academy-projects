def reverser(string, &prc)
    reversed_word = string.reverse
    new_word = ""
    new_word += prc.call(reversed_word)
end

def word_changer(str, &prc)
    words = str.split(" ")
    new_str = ""
    
    words.each_with_index do |word, i|
        first_word = words[0]
        if word == first_word
            new_str += prc.call(word)
        else  
            new_str += " " + prc.call(word)
        end
    end
    new_str
end

def greater_proc_value(n, prc_1, prc_2)
    return prc_1.call(n) if prc_1.call(n) > prc_2.call(n)
    return prc_2.call(n)
end

def and_selector(array, prc_1, prc_2)

    array.select { |ele| prc_1.call(ele) == true && prc_2.call(ele) == true }
end

#def alternating_mapper(array, prc_1, prc_2)
#    
#    array.map do |ele| 
#        if even_index?(ele)
#            prc_1.call(ele)
#        else   
#            prc_2.call(ele)
#        end
#    end
#end

def alternating_mapper(array, prc_1, prc_2)
    mapped = []
    array.each_with_index do |el, idx|
        if idx % 2 == 0
           mapped << prc_1.call(el)
        else 
            mapped << prc_2.call(el)
        end 
    end
   mapped
end