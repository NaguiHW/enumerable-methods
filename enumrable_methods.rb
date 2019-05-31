# frozen_string_literal: true

module Enumerable
  def my_each
    if block_given?
      count = 0
      while count < length
        yield(self[count])
        count += 1
      end
      self
    end
    self
  end

  def my_each_with_index
    if block_given?
      count = 0
      while count < length
        yield(self[count], count)
        count += 1
      end
      self
    end
    self
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
      while count < length
        return false unless yield(self[count])

        count += 1
      end
      true
    end
    true
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
      while count < length
        return false if yield(self[count])

        count += 1
      end
      true
    end
    false
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
      while count < length - 1
        count.zero? ? aux = yield(self[count + 1], self[count]) : aux = yield(aux, self[count + 1])
        count += 1
      end
      aux
    end
  end
end
