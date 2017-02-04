def multiply(ary, num)
  ary.map { |el| el * num }
end

def multiply(ary, num)
  counter = 0
  result = []
  loop do
    result << ary[counter] * num
    counter += 1
    break if counter == ary.size
  end
  result
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]