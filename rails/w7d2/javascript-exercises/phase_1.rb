class Array
    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i])

            i += 1
        end

        self
    end

    def my_map(&prc)
        arr = []

        i = 0

        while i < self.length
            arr << prc.call(self[i])

            i += 1
        end

        arr
    end

    def my_reduce(acc=0, &prc)
        acc ||= self[0]
        
        if acc.nil?
            self[1..-1].my_each  { |el| acc = prc.call(acc, el) }
        else
            self.my_each { |el| acc = prc.call(acc, el) }
        end

        acc
    end
end

p [1, 2, 3, 4].my_each { |el| el * 2 }

p [1, 2, 3, 4].my_map({ |el| el * 2 })

p [1, 2, 3, 4].my_reduce(acc = 0) { |acc, el| acc + el }
p [1, 2, 3, 4].my_reduce(acc = 100) { |acc, el| acc + el }

