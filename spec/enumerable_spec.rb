# frozen_string_literal: true

require './enumerable_methods'

RSpec.describe Enumerable do
  describe '#my_each' do
    it 'Returns the same array' do
      arr = [1, 2, 3]
      expect(arr.my_each { |x| x * 2 }).to eql([1, 2, 3])
    end
  end
  describe '#my_each_with_index' do
    it 'Returns the array with the index number' do
      arr = %w[apple banana orange]
      expect(arr.my_each_with_index { |val, ind| "#{ind}. #{val}" }).to eql(%w[apple banana orange])
    end
  end
  describe '#my_select' do
    it 'Returns an array with the elements grater than 1' do
      arr = [1, 2, 3]
      expect(arr.my_select { |x| x > 1 }).to eql([2, 3])
    end
  end
  describe '#my_all?' do
    it 'Returns true if all elements fulfill the condition, otherwise false' do
      arr = [1, 2, 3]
      expect(arr.my_all? { |x| x > 1 }).to eql(false)
    end
  end
  describe '#my_any?' do
    it 'Returns true if any element fulfill the condition, otherwise false' do
      arr = [1, 2, 3]
      expect(arr.my_any? { |x| x > 1 }).to eql(true)
    end
  end
  describe '#my_none?' do
    it 'Returns true if all elements fulfill the condition, otherwise false' do
      arr = [1, 2, 3]
      expect(arr.my_none? { |x| x > 1 }).to eql(false)
    end
  end
  describe '#my_count' do
    it 'Count how many elements fulfill the condition' do
      arr = [1, 2, 3]
      expect(arr.my_count { |x| x > 1 }).to eql(2)
    end
    it 'Count how many elements are equals to the element inside of the parenthesis' do
      arr = [1, 2, 3, 2, 5, 7, 2, 1, 5, 2]
      expect(arr.my_count(2)).to eql(4)
    end
  end
  describe '#my_map' do
    it 'Returns an array with true or false for each element if fulfilling the conditions or not' do
      arr = [1, 2, 3]
      expect(arr.my_map(&:odd?)).to eql([true, false, true])
    end
  end
  describe '#my_inject' do
    it 'Adds all numbers in an array and give out a single number' do
      arr = [1, 2, 3]
      expect(arr.my_inject { |x, y| x + y }).to eql(6)
    end
  end
end
