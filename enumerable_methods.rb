module Enumerable
  # 1. my_each method
  def my_each(&block)
    each(&block)
  end

  # 2. my each with index methods
  def my_each_with_index
    (0..length - 1).each do |index|
      yield(self[index], index)
    end
  end

  # 3. my select method
  def my_select
    result = []
    my_each do |arr_item|
      result << arr_item if yield(arr_item)
    end
    result
  end

  # 4. my all method
  def my_all?
    result = true
    my_each do |arr_item|
      result = false unless yield(arr_item)
    end
    result
  end

  # 5. my any method
  def my_any?
    result = false
    my_each do |arr_item|
      result = true if yield(arr_item)
    end
    result
  end

  # 6. my none method
  def my_none?
    result = false
    my_each do |arr_item|
      result = true unless yield(arr_item)
    end
    result
  end

  # 7. my count method
  def my_count
    return length unless block_given?

    result = 0
    my_each do |arr_item|
      result += 1 if yield(arr_item)
    end
    result
  end

  # 8. my map method
  def my_map
    result = []
    my_each do |arr_item|
      result << yield(arr_item)
    end
    result
  end

  # 9. my inject method
  def my_inject(initial = nil)
    result = initial.nil? ? self[0] : initial
    index = initial.nil? ? 1 : 0
    self[index...length].my_each do |arr_item|
      result = yield(result, arr_item)
    end
    result
  end
end

# 10. Test my inject by creating multiplication method else
def multiply_els(array)
  array.inject { |result, arr_item| result * arr_item }
end

# # puts "my_each vs. each" cases scenario test
# a = [ "a", "b", "c" ]
# a.my_each {|x| print x, " -- " }
# a = [ "a", "b", "c" ]
# a.each {|x| print x, " -- " }
# [1,2,3,4,5].my_each  { |arr_item| print arr_item * 2 }
# puts ""
# [1,2,3,4,5].each  { |arr_item| print arr_item * 2 }
# puts ""
#
# puts "my_each_with_index vs. each_with_index" case scenario test
# [1,2,3,4,5].my_each_with_index   { |arr_item, index| print [arr_item, index] }
# puts ""
# [1,2,3,4,5].each_with_index  { |arr_item, index| print [arr_item, index] }
# puts ""
#
# puts "my_select vs. select" case scenario test
# print [1,2,3,4,5].my_select { |arr_item|  arr_item.even?  }
# puts ""
# print [1,2,3,4,5].select { |arr_item|  arr_item.even?  }
# puts ""
#
# puts "my_all? vs. all?" test case scenario
# puts [1,2,3,4,5,20].my_all? { |arr_item| arr_item < 10 }
# puts [1,2,3,4,5,20].all? { |arr_item| arr_item < 10 }
#
# puts "my_any? vs. any?" test case scenario
# puts [1,2,3,4,5].my_any? { |arr_item| arr_item > 3 }
# puts [1,2,3,4,5].any? { |arr_item| arr_item > 3 }
#
# puts "my_none? vs. none?" test case scenario
# puts [1,2,3,4,5].my_none? { |arr_item| arr_item > 10 }
# puts [1,2,3,4,5].none? { |arr_item| arr_item > 10 }
#
# puts "my_count vs. count" test case scenario
# puts [1,2,3,4,5].my_count {|arr_item| arr_item % 2 == 0}
# puts [1,2,3,4,5].my_count
# puts [1,2,3,4,5].count {|arr_item| arr_item % 2 == 0}
# puts [1,2,3,4,5].count
#
# puts "my_map vs. map" test case scenario
# print [1,2,3,4,5].my_map { |arr_item| arr_item * 2 }
# puts ""
# print [1,2,3,4,5].map { |arr_item| arr_item * 2 }
# puts ""
#
# puts "my_inject vs. inject" test case scenario
# puts [1,2,3,4,5].my_inject { |sum, arr_item| sum + arr_item }
# puts [1,2,3,4,5].inject { |sum, arr_item| sum + arr_item }
#
# puts "multiply_els" test case
# puts multiply_els([2,4,5])
