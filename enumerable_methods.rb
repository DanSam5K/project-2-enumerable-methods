
def my_each(array)
    index = 0
    while index <= (array.length - 1)
        yield(array[index])
        index += 1
    end
end

# case scenario given
ar1 = [ "a", "b", "c" ]
puts "this is my_each #{my_each(ar1) {|x| print x, " -- " }}"



def my_each_with_index(array)
    index = 0
    while index <= (array.length - 1)
        print index 
        index += 1
    end
end

# case scenario given
ar2 = [ "a", "b", "c" ]
puts "This is my_each_with_index #{my_each_with_index(ar2) {|x| print x, " -- " }}"