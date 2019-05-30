# you have an array [1,2,3,4,5], you want to remove every odd index then when you get to the end of the array you want to reverse it and remove every even index and go back and forth until you have one number left

# so it goes like [1,2,3,4,5] -> remove odd indices --> [1,3,5] --> reverse it --> [5,3,1] -> remove even indices --> [3]

def bullshit_method(arr)
    while arr.length > 2
        arr = arr.reject.with_index { |el, i| i.odd? }
        arr.reverse!
        arr = arr.reject.with_index { |el, i| i.even? }
        arr.reverse!

    end
   arr.first
end

# def bullshit_method(arr)
#     until arr.length <= 1
#         arr = arr.reject.with_index { |el, i| i.odd? }
#     end
#    arr.first
# end

arr_1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]

p bullshit_method([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19])


# [1,2,3,4,5,6,7,8,9,10,11,12] -> [1,3,5,7,9,11] -> [11,9,7,5,3,1] -> [9,5,1] -> [1,5,9] -> [1,9] -> [9,1] -> [1]

# [1,2,3,4,5,6,7,8,9,10,11,12] -> [1,3,5,7,9,11] -> [1,5,9] -> [1,9] -> [1]


# def removals2(arr)
# 	new_arr = arr

# 	swap = false
#     until new_arr.length <= 1
# 		new_arr = new_arr.reject.with_index { |el, i| swap ? i.even? : i.odd? }
# 		new_arr.reverse!
# 		swap = !swap
# 	end
# 	# new_arr == [1]
# 	new_arr.first
# end


def removals3(arr, swap)
    return arr.first if arr.length == 1
    arr.reject!.with_index { |el, i| swap ? i.even? : i.odd? }
	arr.reverse!
	removals3(arr, !swap)
end

p removals3(arr_1, swap = false)