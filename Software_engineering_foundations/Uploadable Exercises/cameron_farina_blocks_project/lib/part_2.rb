require "byebug"

def all_words_capitalized?(words)
    words.all? { |word| word.capitalize == word }
end

def no_valid_url?(urls)
    endings = ['.com', '.net', '.io', '.org']
    urls.none? { |url| endings.any? { |ending| url.end_with?(ending) } }
end

def any_passing_students?(students)
    students.any? do |hash|
    ((hash[:grades].sum) / (hash[:grades].length)) >= 75
    end
end