module Enumerable

    def my_each
        if block_given?
            count = 0
            while count < self.length
                yield(self[count])
                count += 1
            end
            self
        else
            self
        end
    end

    def my_each_with_index
        if block_given?
            count = 0
            while count < self.length
                yield(self[count], count)
                count += 1
            end
            self
        else
            self
        end
    end

    def my_select
        if block_given?
            count = 0
            aux = []
            while count < self.length
                aux.push(self[count]) if yield(self[count])
                count += 1
            end
            aux
        else
            self
        end
    end

    def my_all?
        if block_given?
            count = 0
            while count < self.length
                return false unless yield(self[count])
                count += 1
            end
            true
        else
            true
        end
    end

    def my_any?
        if block_given?
            count = 0
            while count < self.length
                return true if yield(self[count])
                count += 1
            end
            false
        else
            true
        end
    end

    def my_none?
        if block_given?
            count = 0
            while count < self.length
                return false unless !yield(self[count])
                count += 1
            end
            true
        else
            false
        end
    end

    def my_count
        if block_given?
            count = 0
            aux = 0
            while count < self.length
                aux += 1 if yield(self[count])
                count += 1
            end
            aux
        else
            self.length
        end
    end

    def my_map
        if block_given?
            count = 0
            aux = []
            while count < self.length
                aux.push(yield(self[count]))
                count += 1
            end
            aux
        else
            self
        end
    end

    def my_inject
        if block_given?
            count = 0
            aux = 0
            while count < self.length - 1
                count == 0 ? aux = yield(self[count+1], self[count]) : aux = yield(aux, self[count+1])
                count += 1
            end
            aux
        end
    end
end

arr = [1, 2, 3, 4, 5]
arr2 = ["apple", "banana", "pineapple"]
=begin
puts "  ***  Testing my_each  ***  "
arr.my_each { |x| puts x * 5 }
puts "=========  This is a separator ========"
arr.each { |x| puts x * 5 }

puts "  ***  Testing my_each_with_index  ***  "
arr2.my_each_with_index { |value, index| puts "#{index}. #{value}" }
puts "=========  This is a separator ========"
arr2.each_with_index { |value, index| puts "#{index}. #{value}" }

puts "  ***  Testing my_select  ***  "
p arr.my_select { |x| x < 4 }
puts "=========  This is a separator ========"
p arr.select { |x| x < 4 }

puts "  ***  Testing my_all?  ***  "
p arr.my_all? { |x| x < 7 }
puts "=========  This is a separator ========"
p arr.all? { |x| x < 7 }

puts "  ***  Testing my_any?  ***  "
arr.my_any? { |x| puts x < 4 }
puts "=========  This is a separator ========"
arr.any? { |x| puts x < 4 }

puts "  ***  Testing my_all?  ***  "
p arr.my_none? { |x| x < 4 }
puts "=========  This is a separator ========"
p arr.none? { |x| x < 4 }

puts "  ***  Testing my_count  ***  "
p arr.my_count { |x| x < 4 }
puts "=========  This is a separator ========"
p arr.count { |x| x < 4 }

puts "  ***  Testing my_map  ***  "
p arr.my_map { |x| x * 4 }
puts "=========  This is a separator ========"
p arr.map { |x| x * 4 }
=end

puts "  ***  Testing my_inject  ***  "
p arr.my_inject { |total, n| total * n }
puts "=========  This is a separator ========"
p arr.inject { |total, n| total * n }