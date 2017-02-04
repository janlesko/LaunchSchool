# def reverse(array)
#   array.sort { |x, y| y <=> x }
# end

# def reverse(array)
#   index = -1
#   result = []
#   while index >= -array.size
#     result << array[index]
#     index -= 1
#   end

#   result
# end

# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

def reverse(array)
  array.each_with_object([]) { |i, a| a.unshift(i) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
p 
p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true