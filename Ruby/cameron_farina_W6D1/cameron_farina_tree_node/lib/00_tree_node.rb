class PolyTreeNode

    attr_reader :parent, :children
    attr_accessor :value

    def initialize(value, parent = nil)
        @value = value
        @children = []
        @parent = parent
    end

    def parent=(parent_node)
        if @parent
            @parent.children.delete(self)
        end
        @parent = parent_node
        return @parent unless @parent
        parent_children = parent_node.children
        parent_children << self unless parent_children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Not a child" unless self.children.include?(child_node)

        child_node.parent = nil
    end

    def dfs(target_value)
        if self.value == target_value
            return self
        else
            self.children.each do |child|
                val = child.dfs(target_value)
                return val if val
            end
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self

        until queue.empty?
            node = queue.shift
        
            return node if node.value == target_value
        
            queue.concat(node.children)
        end
        nil
    end
end