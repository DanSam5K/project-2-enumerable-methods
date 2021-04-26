module Enumerable
  #1. my_each method
  def my_each
    for arr_item in self
      yield(arr_item)
    end
  end
  #2. my each with index methods
  def my_each_with_index
    for index in (0..self.length - 1)
      yield(self[index], index)
    end
  end
  # 3. my select method
  def my_select
    result = []
    return to_enum(:my_select) unless block_given?
    my_each do |arr_item|
      result << arr_item if yield(arr_item)
    end
    result
  end
  # 4. my all method
  def my_all?(nothing = {})
    return my_all?(nothing) { |v| v } unless block_given?
    if nothing.is_a? Regexp
        my_all? { |v| v.match(nothing) }
    elsif nothing == Class
        my_all? { |v| v.is_a? nothing }
    elsif nothing == nothing
        my_each { |v| return false unless yield(v) }
        true
    else
        my_all? { |v| v == nothing }
    end
  end
  # 5. my any method
  def my_any?(*arg)
    result = false
    if !arg[0].nil?
      my_each { |element| result = true if arg[0] === element }
    elsif !block_given?
      my_each { |element| result = true if element }
    else
      my_each { |element| result = true if yield(element) }
    end
    result
  end

  # 6. my none method
  def my_none?(arg = nil, &block)
    !my_any?(arg, &block)
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
