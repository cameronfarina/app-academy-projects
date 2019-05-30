def hipsterfy(word)
    vowels = "aeiou"

    i = word.length - 1
    while i >= 0
        char = word[i]
        if vowels.include?(char)
            char = ""
            return word[0...i] + word[i + 1..-1]
        end

        i -= 1
    end

    word

end

def vowel_counts(str)
    vowels = "aeiou"
    counts = Hash.new(0)

    str.each_char do |char|
        if vowels.include?(char.downcase)
            counts[char.downcase] += 1
        end
    end
    counts
end

def caesar_cipher(str, num)
    new_string = ""
    alphabet = ("a".."z").to_a

        str.each_char do |char|
            if alphabet.include?(char)
                initial_chars_alphabet_index = alphabet.index(char)
                new_chars_alphabet_index = initial_chars_alphabet_index + num
                new_string += alphabet[new_chars_alphabet_index % 26]
            else
                new_string += char
            end
        end
    new_string
end