# def bad_two_sum?(arr, target)
#     (0...arr.length).each do |i|
#         (i + 1...arr.length).each do |j|
#             return true if arr[i] + arr[j] == target
#         end
#     end
#     false
# end
class Array

  def my_bsearch(target)
    return nil if size == 0
    mid = size/2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      return self.dup.take(mid).my_bsearch(target)
    else
      search_res = self.dup.drop(mid+1).my_bsearch(target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end

  def two_sum_bsearch(target)
    self.each do |ele|
        new_target = target - ele
        return true if self.my_bsearch(new_target)
    end

    false
  end
end

# arr = [0, 1, 5, 7] 
# target = 6
# p arr.two_sum_bsearch(target)


def two_sum_hash?(arr,target)
    hash = {}

    arr.length.times do |idx|
        search = (target - arr[idx])

        return true if hash[search]
        hash[arr[idx]] = arr[idx]
    end
    false
end
arr = [0, 1, 0, 3, 9, 5, 7] 
target = 6
p two_sum_hash?(arr, target)



def four_sum?(arr, target)
    sums = []
    hash = {}

    arr.length.times do |idx|
        search = (target - arr[idx])

        if  hash[search]
            sums << [arr.index(hash[search]), idx]
        end

        hash[arr[idx]] = arr[idx]
    end
   p sums
end

arr = [3, 5, 4, 1, 14, 35, 32, 21] 
target = 13
p four_sum?(arr, target)