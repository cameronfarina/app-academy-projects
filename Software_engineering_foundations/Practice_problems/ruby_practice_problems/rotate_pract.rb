
def my_rotate!(array, amt)
    if amt < 0
        new_amt = amt / (-1)
        last_elements = array.pop(new_amt)
        array.unshift(last_elements)
        array.flatten!
    else  
        new_ele = array.shift(amt)
        array << new_ele
        array.flatten!
    end
end

array_1 = ["a", "b", "c", "d"]
p array_1.object_id
result_1 = my_rotate!(array_1, 2)
p result_1
p result_1.object_id

array_2 = ["a", "b", "c", "d"]
p array_2.object_id
result_2 = my_rotate!(array_2, -3)
p result_2
p result_2.object_id

array_3 = ["NOMAD", "SOHO", "TRIBECA"]
p array_3.object_id
result_3 = my_rotate!(array_3, 1)
p result_3
p result_3.object_id