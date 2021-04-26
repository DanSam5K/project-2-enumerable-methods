module Enumerable
  # 1. my_each method
  def my_each
    return enum_for unless block_given?
    for arr_item in self
      yield(arr_item)
    end
  end

  # 2. my each with index methods
  def my_each_with_index
    enum = to_a
    if block_given?
      enum.length.times do |arr_index|
        yield(enum[arr_index], arr_index)
      end
      self
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
  def my_all?(*args)
    result = true
    if !args[0].nil?
      my_each { |element| result = false unless args[0] === element }
    elsif !block_given?
      my_each { |element| result = false unless element }
    else
      my_each { |element| result = false unless yield(element) }
    end
    result
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
  def my_count(num = nil)
    count_num = 0
    if num
      my_each { |element| count_num += 1 if element == num }
    elsif !block_given?
      count_num = length
    else
      my_each { |element| count_num += 1 if yield element }
    end
    count_num
  end

  # 8. my map method
  def my_map
    result = []
    return to_enum(:my_map) unless block_given?

    my_each do |arr_item|
      result << yield(arr_item)
    end
    result
  end

  # 9. my inject method
  def my_inject(*param)
    list = is_a?(Range) ? to_a : self
    reduce = param[0] if param[0].is_a?(Integer)
    operator = param[0].is_a?(Symbol) ? param[0] : param[1]
    if operator
      list.my_each { |item| reduce = reduce ? reduce.send(operator, item) : item }
      return reduce
    end
    list.my_each { |item| reduce = reduce ? yield(reduce, item) : item }
    reduce
  end
end

# 10. Test my inject by creating multiplication method else
def multiply_els(array)
  array.inject { |result, arr_item| result * arr_item }
end
