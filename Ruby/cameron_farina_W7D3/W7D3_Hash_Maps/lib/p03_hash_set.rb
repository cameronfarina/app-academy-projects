class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash = key.hash
    if !include?(key)
      @store[hash % num_buckets] << key
      self.count += 1
    end
    resize! if num_buckets == self.count
  end

  def include?(key)
    @store.any? { |bucket| bucket.include?(key) }
  end

  def remove(key)
    hash = key.hash
    if include?(key)
      @store[hash % num_buckets].delete(key)
      self.count -= 1 
    end 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
