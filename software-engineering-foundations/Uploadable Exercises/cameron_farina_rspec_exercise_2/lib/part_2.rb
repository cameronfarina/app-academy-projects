def palindrome?(str)
    reverse_word = ""

    i = 0
    while i < str.length
        if str[i] == str[-i - 1]
            reverse_word += str[-i - 1]
        end

        i += 1
    end
    reverse_word == str
end

def substrings(str)
    new_array = []

    (0...str.length).each do |start_idx|
        (start_idx...str.length).each do |end_idx|
        substring  = str[start_idx..end_idx]
        new_array << substring
        end
    end

    new_array
end

def palindrome_substrings(str)

    substrings(str).select { |substring| palindrome?(substring) && substring.length > 1 }
        
end