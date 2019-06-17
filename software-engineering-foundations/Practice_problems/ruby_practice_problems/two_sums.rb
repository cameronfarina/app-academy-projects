def two_sum(nums, target)
    new_array = []
    search = Hash.new
   
    nums.each_with_index do |item, index|
        i = search[target-item]
        new_array += [i, index] if i != nil
        search[item] = index
    end
    new_array
end
