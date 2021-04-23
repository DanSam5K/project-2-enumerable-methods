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
