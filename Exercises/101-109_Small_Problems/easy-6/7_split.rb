# def halvsies(array)
#   first_half = (array.size / 2.to_f).round
#   result = [array[0..first_half-1], array[first_half..array.size]]
# end

# def halvsies(array)
#   first_half = (array.size / 2.to_f).round
#   second_half = array.size - first_half
#   p result = [array.first(first_half), array.last(second_half)]
# end

def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]