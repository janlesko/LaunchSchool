# def find_fibonacci_index_by_length(length)
#   num1, num2, i = -1 , 0, 1

#   while i.to_s.length < length
#     num1 += 1
    
#     i, num2 = num2, num2 + i
#   end

#   p num1
# end

def find_fibonacci_index_by_length(length)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second

    break if fibonacci.to_s.length >= length

    first = second
    second = fibonacci
  end

  index
end


p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847