# def sum_of_sums(ary)
#   counter = 1
#   result = 0
#   while counter <= ary.size
#     result += ary.first(counter).inject(:+)
#     counter += 1
#   end
#   p result
# end

# def sum_of_sums(numbers)
#   sum_total = 0
#   1.upto(numbers.size) do |count|
#     sum_total += numbers.slice(0, count).reduce(:+)
#     p count
#   end
#   sum_total
# end

def sum_of_sums(arr)
  total = 0
  arr.each_index { |idx| total += arr[0..idx].inject(:+) }
  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35