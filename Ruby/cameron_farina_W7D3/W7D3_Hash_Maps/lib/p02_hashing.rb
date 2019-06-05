# class Integer
#   # Integer#hash already implemented for you
# end

class Array
  def hash
    num = 0
    self.each_with_index do |ele, i|
       num += (ele.to_s.ord * i.hash)
    end
    num 
  end
end

class String
  def hash
    num = 0
    self.each_char.with_index do |ele, i|
      num += (ele.to_s.ord * i.hash)
    end

    num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
     to_a.sort_by(&:zip).hash
  end
end

# self.keys.sort + self.values.sort

# to_a.sort_by(&:hash).hash

# arr = self.keys.sort + self.values.sort
#     arr.hash