class MaxIntSet

  attr_reader :store, :max

  def initialize(max)
    @store = Array.new(max)
    @max = max
  end

  def insert(num)
    raise 'Out of bounds' if num < 0 || num > @max
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store.any? { |bucket| bucket.include?(num) }
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if include?(num)
    @store[num % num_buckets] << num
    self.count += 1
    resize! if num_buckets == self.count
  end

  def remove(num)
    return if !include?(num)
    @store[num % num_buckets].delete(num)
    self.count -= 1
  end

  def include?(num)
    @store.any? { |bucket| bucket.include?(num) }
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
      new_store = Array.new(num_buckets * 2) { Array.new}
      @store.each { |bucket| bucket.each { |num| new_store[num % num_buckets] << num } }
      @store = new_store
  end
end
