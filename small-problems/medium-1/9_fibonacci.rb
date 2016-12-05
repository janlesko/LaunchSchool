def fibonacci(nth)
  first = 1
  second = 1
  3.upto(nth) do
    fibo = first + second
    first = second
    second = fibo
  end

  second
end

# def fibonacci(nth)
#   first, last = [1, 1]

#   3.upto(nth) do
#     first, last = [last, first + last]
#     p first
#     p last
#   end

#   p last
# end


p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501