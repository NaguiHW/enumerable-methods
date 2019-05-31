module Enumerable
    def my_each(x)
        count = 0
        while count < x.length
            yield(x[count])
            count += 1
        end
    end

    def my_each_with_index(x)
        count = 0
        while count < x.length
            yield(x[count], count)
            count += 1
        end
    end
end

include Enumerable

arr = [1, 2, 3, 4]
arr2 = ["apple", "banana", "pineapple"]

puts "Testing my_each"
Enumerable.my_each(arr) { |x| puts x + 1 }
# arr.each { |x| puts x + 1 }

puts "Testing my_each_with_index"
Enumerable.my_each_with_index(arr2) { |value, index| puts "#{index}. #{value}" }
# arr2.each_with_index { |value, index| puts "#{index}. #{value}" }

