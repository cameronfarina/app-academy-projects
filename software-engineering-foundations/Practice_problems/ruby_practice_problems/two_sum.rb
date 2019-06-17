def two_sum(nums, target)
    search = Hash.new
    nums.each_with_index do |item, index|
        i = search[target-item]
        return [i+1, index+1] if i != nil
        search[item] = index
    end
    search
end


p two_sum([1, 13, 7, 4, 3, 4], 6)