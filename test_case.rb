require './enumerable_methods'

# # puts "my_each vs. each" cases scenario test
# a = %w[a b c]
# a.my_each { |x| print x, ' -- ' }
# a.each { |x| print x, ' -- ' }

# [1, 2, 3, 4, 5].my_each { |arr_item| print arr_item * 2 }
# puts ''
# [1, 2, 3, 4, 5].each { |arr_item| print arr_item * 2 }

# puts (1...5).my_each { |arr_item| print arr_item * 2 }
# puts ""
# puts (1...5).each { |arr_item| print arr_item * 2 }

# h = { "a" => 100, "b" => 200 }
# h.my_each {|key, value| puts "#{key} is #{value}" }
# h.each {|key, value| puts "#{key} is #{value}" }

# # puts "my_each_with_index vs. each_with_index" case scenario test
# [1, 2, 3, 4, 5].my_each_with_index { |arr_item, index| print [arr_item, index] }
# puts ''
# [1, 2, 3, 4, 5].each_with_index { |arr_item, index| print [arr_item, index] }
# puts ''
# puts (1...5).my_each_with_index  {|arr_item| print arr_item * 2 }
# puts (1...5).each_with_index  {|arr_item| print arr_item * 2 }
# hash = Hash.new
# print %w(cat dog wombat).my_each_with_index { |item, index|
#   hash[item] = index
# }
# print %w(cat dog wombat).each_with_index { |item, index|
#   hash[item] = index
# }
# # puts "my_select vs. select" case scenario test
# print [1, 2, 3, 4, 5].my_select(&:even?)
# puts ''
# print [1, 2, 3, 4, 5].select(&:even?)
# puts ''
# # When no block is given in "my_select vs. select" case scenario test
# puts([1, 2, 3, 4, 5].my_select)
# puts([1, 2, 3, 4, 5].select)

# # puts "my_all? vs. all?" test case scenario
# puts([1, 2, 3, 4, 5].my_all? { |arr_item| arr_item < 10 })
# puts([1, 2, 3, 4, 5].all? { |arr_item| arr_item < 10 })
# # puts "my_any? vs. any?" test case scenario
# puts([1, 2, 3, 4, 5].my_any? { |arr_item| arr_item > 3 })
# puts([1, 2, 3, 4, 5].any? { |arr_item| arr_item > 3 })

# # puts "my_none? vs. none?" test case scenario
# puts([1, 2, 3, 4, 5].my_none? { |arr_item| arr_item > 10 })
# puts([1, 2, 3, 4, 5].none? { |arr_item| arr_item > 10 })

# # puts "my_count vs. count" test case scenario
# puts([1, 2, 3, 4, 5].my_count(&:even?))
# puts([1, 2, 3, 4, 5].my_count)
# puts [1, 2, 3, 4, 5].count(&:even?)
# puts [1, 2, 3, 4, 5].count

# # puts "my_map vs. map" test case scenario
# print([1, 2, 3, 4, 5].my_map { |arr_item| arr_item * 2 })
# puts ''
# print([1, 2, 3, 4, 5].map { |arr_item| arr_item * 2 })
# puts ''

# # puts "my_inject vs. inject" test case scenario
# puts([1, 2, 3, 4, 5].my_inject { |sum, arr_item| sum + arr_item })
# puts([1, 2, 3, 4, 5].inject { |sum, arr_item| sum + arr_item })

# # puts "multiply_els" test case
# puts multiply_els([2, 4, 5])
