# def multiply_list(ary1, ary2)
#   result = []
#   ary1.each_with_index do |num, index|
#     result << num * ary2[index]
#   end
#   p result
# end

# def multiply_list(arr1, arr2)
#   arr1.map.with_index { |element, index| element * arr2[index] }
# end

def multiply_list(ary1, ary2)
  p ary1.zip(ary2).map { |pair| pair.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]