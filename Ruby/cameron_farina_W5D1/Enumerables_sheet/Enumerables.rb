class Array 
    
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])

            i += 1
        end
        self
    end

    def my_select(&prc)
        new_array = []

        self.my_each do |ele|
            if prc.call(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_reject(&prc)
        new_array = []

        self.my_each do |ele|
            if !prc.call(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_any?(&prc)

        self.each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        new_array = []
 
        self.my_each do |ele|
            if ele.is_a?(Array)
                new_array += ele.my_flatten
            else
                new_array << ele
            end
        end

        new_array
    end

    def my_zip(*arg)
        new_array = []
        
        i = 0
        j = 0
        while i < self.length 
            temp_arr = [self[i]]
            j=0
           while j < arg.length
                if (i < arg[j].length)
                    temp_arr << arg[j][i] 
                else
                    temp_arr  << nil
                end
                j += 1
           end
           new_array << temp_arr   
           i += 1
        end

        new_array
    end

     def my_rotate(num = 1)
        
        if num < 0
            new_num = num.abs
            last_ele = self.pop(new_num)
            self.unshift(last_ele)
        else
            new_ele = self.shift(num)
            self << new_ele
        end 
       self.my_flatten
    end

    def my_join(sep = "")
        new_str = ""

        self.my_each do |str|
            if !sep.nil?
                new_str += sep + str
            else
                new_str += str
            end
        end

        new_str[1..-1]
    end
      
    def my_reverse
        return [self] if self.length == 1
        ([self[-1]] + self[0..-2].my_reverse).my_flatten
    end

    def bubble_sort!(&prc)
        prc ||= Proc.new { |a, b| a <=> b }

        return self if self.empty?

        sorted = false
        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    sorted = false
                    self[i], self[i+ 1] = self[i + 1], self[i]
                end
            end
            
        end
        self.flatten
    end

    def bubble_sort(&prc)

        copy = self.dup
        copy.bubble_sort!
    end

end

def factors(num)
    all_factors = []
    
    (1..num).each do |factor|
       all_factors << factor if num % factor == 0
    end

    all_factors
end

def substrings(string)
     subs = []

    (0...string.length).each do |start_idx|
      (start_idx...string.length).each do |end_idx|
          subs << string[start_idx..end_idx]
        end
    end

    subs
end

def subwords(word, dictionary)
    new_array = []
    subs = []

      (0...word.length).each do |start_idx|
        (start_idx...word.length).each do |end_idx|
            subs << word[start_idx..end_idx]
          end
      end

        i = 0
        while i < subs.length
            if dictionary.include?(subs[i]) && !new_array.include?(subs[i])
              new_array << subs[i]
            end

        i += 1
        end
        
    new_array
end