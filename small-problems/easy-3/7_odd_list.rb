# def oddities(array)
#   new = []
#   new << array[0] if array[0] != nil
#   new << array[2] if array[2] != nil
#   new << array[4] if array[4] != nil
#   new
# end

# def oddities(array)
#   new_array = []
#   array.each_with_index { |val, idx| new_array << val if idx.even? }
#   new_array
# end

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []