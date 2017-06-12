require 'pry'

# def permutations(ary)
#   result = []
#   1000.times { result << ary.shuffle }
#   result.uniq.sort
# end

def permutations(array)
  return [array] if array.size == 1

  result = []
  array.each_with_index do |element, index|
    sub_array = array[0...index] + array[(index + 1)..-1]
    binding.pry
    sub_permutations = permutations(sub_array)
    binding.pry
    sub_permutations.each do |permutation|
      result << [element] + permutation
    end
  end

  p result
end

# p permutations([2])
# -> [[2]]

# p permutations([1, 2])
# -> [[1, 2], [2, 1]]

permutations([1, 2, 3]) == [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
# 3 -- 6

# p permutations([1, 2, 3, 4]) == [[1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4],
#     [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2],
#     [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4],
#     [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1],
#     [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4],
#     [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1],
#     [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3],
#     [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]]