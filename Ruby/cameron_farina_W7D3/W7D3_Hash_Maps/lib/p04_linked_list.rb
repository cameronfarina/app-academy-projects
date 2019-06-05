class Node
  
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    next_node, prev_node = self.next, self.prev 
    next_node.prev, prev_node.next = prev_node, next_node
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key 
    end
  end

  def include?(key)
    self.any? { |node| node.key == key }
  end

  def append(key, val)
    new_node = Node.new(key, val)
    tail_prev = self.tail.prev
    tail_prev.next = new_node
    new_node.next = self.tail
    self.tail.prev = new_node
    new_node.prev = tail_prev
    new_node
  end

  def update(key, val)
      self.each do |node|
        node.val = val if node.key == key
        return
      end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return
      end
    end
  end

  def each
    current_node = @head.next
    until current_node == self.tail
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
