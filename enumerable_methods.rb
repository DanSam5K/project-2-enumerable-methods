# #1.my_each
# def my_each(array)
#     index = 0
#     while index <= (array.length - 1)
#         yield (array[index])
#         index += 1
#     end
# end
# # case scenario given
# ar1 = [ "a", "b", "c" ]
# puts "This is my_each #{my_each(ar1) {|x| print x, " -- " }}"
# puts " This is my_each #{my_each(ar1) {|x| print x*2}}"


# #2.my_each_with_index
# def my_each_with_index(array)
#     index = 0
#     while index <= (array.length - 1)
#         yield index
#         index += 1
#     end
# end
# # case scenario given
# ar2 = [ "a", "b", "c" ]
# puts "This is my_each_with_index #{my_each(ar1) {|x| print x, " -- " }}"
# puts " This is my_each_with_index  #{my_each_with_index(ar2) {|x| print x*2}}"


# # 3.my_select
# def my_select(array)
#     index = 0
#     arr = Array[]
#     while index <= (array.length - 1)
#             arr << array[index] if yield array[index]
#         index += 1
#     end
#     arr
# end
# # case scenario given
# a = %w[ a b c d e f ]
# print my_select(a) {|v| v =~ /[aeiou]/ }    #=> ["a", "e"]

# #my all
# def my_all?
#     result = true
#     my_each do |item|
#         result = false if !yeild(item)
#     end
#     result
# end

# # case scenario given
# a = %w[ a b c d e f ]
# print my_all(a) {|v| v =~ /[aeiou]/ }    #=> ["a", "e"]

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
    #3. my select method
    def my_select
        result = []
        my_each do |arr_item|
          result << arr_item if yield(arr_item)
        end
        result
    end
    #4. my all method
    def my_all?
        result = true
        my_each do |arr_item|
            result = false if !yield(arr_item)
        end
        result
    end
    #5. my any method
    def my_any?
        result = false
        my_each do |arr_item|
            result = true if yield(arr_item)
        end
        result
    end


end

# puts "my_each vs. each" cases scenario test
a = [ "a", "b", "c" ]
a.my_each {|x| print x, " -- " }
a = [ "a", "b", "c" ]
a.each {|x| print x, " -- " }
[1,2,3,4,5].my_each  { |arr_item| print arr_item * 2 }
puts ""
[1,2,3,4,5].each  { |arr_item| print arr_item * 2 }
puts ""

# puts "my_each_with_index vs. each_with_index" case scenario test
[1,2,3,4,5].my_each_with_index   { |arr_item, index| print [arr_item, index] }
puts ""
[1,2,3,4,5].each_with_index  { |arr_item, index| print [arr_item, index] }
puts ""

# puts "my_select vs. select" case scenario test
print [1,2,3,4,5].my_select { |arr_item|  arr_item.even?  }
puts ""
print [1,2,3,4,5].select { |arr_item|  arr_item.even?  }
puts ""

# puts "my_all? vs. all?" test case scenario
puts [1,2,3,4,5,20].my_all? { |arr_item| arr_item < 10 }
puts [1,2,3,4,5,20].all? { |arr_item| arr_item < 10 }

# puts "my_any? vs. any?" test case scenario
puts [1,2,3,4,5].my_any? { |arr_item| arr_item > 3 }
puts [1,2,3,4,5].any? { |arr_item| arr_item > 3 }