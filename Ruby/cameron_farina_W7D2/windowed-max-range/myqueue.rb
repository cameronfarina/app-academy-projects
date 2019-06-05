require_relative './windowed-max-range.rb'

class MyQueue

    def initialize
        @store = []
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.size == 0
    end

    def enqueue(var)
        @store.push(var)
    end

    def dequeue
        @store.shift
    end
end


class MyStack

    def initialize
        @store = []
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.size == 0
    end

    def enqueue(var)
        @store.push(var)
    end

    def dequeue
        @store.pop
    end

end

class StackQueue

    def initialize
        @in_stack = MyStack.new
        @out_stack = MyStack.new
    end

    def size
        @in_stack.size + @out_stack.size
    end

    def empty?
        @in_stack.empty? && @out_stack.empty?
    end

    def enqueue(val)
        @in_stack.push(val)
    end

    def dequeue
        @out_stack.pop unless @out_stack.empty?

        self.reverse
    end

    def reverse
   
        if @out_stack.empty?
            until @in_stack.empty?
                @out_stack.push(@in_stack.pop)
            end
        end

    end

end

class MinMaxStack


end

class MinMaxStackQueue


end
