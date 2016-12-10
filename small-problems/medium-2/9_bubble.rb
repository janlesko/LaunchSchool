# def bubble_sort!(array)

#   loop do

#     index = 0
#     swapped = false

#     loop do
#       break if index == array.size - 1
#         if array[index] > array[index + 1]
#           array[index], array[index + 1] = array[index + 1], array[index]
#           swapped = true
#         end
#       index += 1
#     end

#     break if swapped == false
#   end

#   array
# end

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end
#     break if swapped == false
#   end
#   nil
# end

require 'pry'

def bubble_sort!(array)
  n = array.length - 1
  loop do
    newn = 0
    (0..n - 1).each do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        newn = idx # <= This is where we track the location of the swap; the loop will end on the last swap
      end
    end
    n = newn # <= This is where we update the range of elements to look at
    break if n == 0
  end
  array
end

# p array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

# p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)