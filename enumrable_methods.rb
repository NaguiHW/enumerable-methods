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
end

#include Enumerable

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
=end
puts "  ***  Testing my_select  ***  "
p arr.my_select
puts "=========  This is a separator ========"
p arr.select