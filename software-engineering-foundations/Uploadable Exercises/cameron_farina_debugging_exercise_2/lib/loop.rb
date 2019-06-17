def my_array(arr)
    repeated_chars = []
    i = 0
    while i < arr.length - 1
        (0...arr.length - 1).each do |ele|
            if  ele == ele[1..-1]
                repeated_chars << ele
            end
        end

        i += 1
    end
    repeated_chars
end

p my_array(["a", "b", "c", "c", "b"])