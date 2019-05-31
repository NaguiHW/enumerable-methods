module Enumerable
    def my_each(x)
        count = 0
        while count < x.length
            puts yield(x[count])
            count += 1
        end
    end
end

include Enumerable

arr = [1, 2, 3, 4]

Enumerable.my_each(arr) { |x| x + 1 }
