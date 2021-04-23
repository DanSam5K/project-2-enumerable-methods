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
    def my_each
        for arr_item in self
            yield(arr_item)
        end
    end
end

# puts "my_each vs. each" cases scenario test
[1,2,3,4,5].my_each  { |arr_item| print arr_item * 2 }
puts ""
[1,2,3,4,5].each  { |arr_item| print arr_item * 2 }
puts ""

