module Enumerable

    def my_each
        return self unless block_given?
        count = 0
        while count < self.length
            yield(self[count])
            count += 1
        end
        self
    end

    def my_each_with_index
        return self unless block_given?
        count = 0
        while count < self.length
            yield(self[count], count)
            count += 1
        end
    end

    
end

#include Enumerable

arr = [1, 2, 3, 4]
arr2 = ["apple", "banana", "pineapple"]
=begin
puts "  ***  Testing my_each  ***  "
arr.my_each { |x| puts x * 5 }
puts "=========  This is a separator ========"
arr.each { |x| puts x * 5 }
=end

puts "  ***  Testing my_each_with_index  ***  "
arr2.my_each_with_index { |value, index| puts "#{index}. #{value}" }
puts "=========  This is a separator ========"
arr2.each_with_index { |value, index| puts "#{index}. #{value}" }

