# frozen_string_literal: true

require './enumerable_methods'

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:arr2) { ['apple', 'banana', 'orange']}
  let(:arr3) { [5, 7, 9] }
  describe '#my_each' do
    it 'Returns the same array' do
      expect(arr.my_each { |x| x * 2 }).to eql([1, 2, 3])
    end
    it 'should iterate from every item on the array' do
      final = []
      arr.my_each { |x| final << x * 2 }
      expect(final).to eql([2, 4, 6])
    end
  end
  describe '#my_each_with_index' do
    it 'Returns the array with the index number' do
      expect(arr2.my_each_with_index { |val, ind| "#{ind}. #{val}" }).to eql(%w[apple banana orange])
    end
    it 'We can print the index and the element or one of both' do
      final = []
      arr2.my_each_with_index { |val, ind| final << "#{ind}. #{val}" }
      expect(final).to eql(["0. apple", "1. banana", "2. orange"])
    end
  end
  describe '#my_select' do
    it 'Returns an array with the elements grater than 1' do
      expect(arr.my_select { |x| x > 1 }).to eql([2, 3])
    end
    it 'Returns an array that are evens' do
      final = arr.my_select(&:even?)
      expect(final).to eql([2])
    end
  end
  describe '#my_all?' do
    it 'Returns true if all elements fulfill the condition, otherwise false' do
      expect(arr.my_all? { |x| x > 1 }).to eql(false)
    end
    it 'Returns true if all elements fulfill the condition, otherwise false' do
      final = arr.my_all? { |x| x > 0 }
      expect(final).to eql(true)
    end
  end
  describe '#my_any?' do
    it 'Returns true if any element fulfill the condition, otherwise false' do
      expect(arr.my_any? { |x| x > 1 }).to eql(true)
    end
    it 'Returns true if any element fulfill the condition, otherwise false' do
      expect(arr2.my_any? { |x| x.length > 8 }).to eql(false)
    end

  end
  describe '#my_none?' do
    it 'Returns true if all elements fulfill the condition, otherwise false' do
      expect(arr.my_none? { |x| x > 1 }).to eql(false)
    end
    it 'Returns true if all elements fulfill the condition, otherwise false' do
      expect(arr2.my_none? { |x| x.length > 10 }).to eql(true)
    end
  end
  describe '#my_count' do
    it 'Count how many elements fulfill the condition' do
      expect(arr.my_count { |x| x > 1 }).to eql(2)
    end
    it 'Count how many elements are equals to the element inside of the parenthesis' do
      expect(arr.my_count(2)).to eql(1)
    end
  end
  describe '#my_map' do
    it 'Returns an array with true or false for each element if fulfilling the conditions or not' do
      expect(arr.my_map(&:odd?)).to eql([true, false, true])
    end
    it 'Returns an array with true or false for each element if fulfilling the conditions or not' do
      expect(arr.my_map(&:even?)).to eql([false, true, false])
    end
  end
  describe '#my_inject' do
    it 'Adds all numbers in an array and give out a single number' do
      expect(arr.my_inject { |x, y| x + y }).to eql(6)
    end
    it 'Adds all numbers in an array and give out a single number' do
      expect(arr3.my_inject { |x, y| x + y }).to eql(21)
    end
  end
end
