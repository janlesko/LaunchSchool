# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end

# p sum(5)

def fibonacci(nth)
  if nth < 2
    nth
  else
    fibonacci(nth - 1) + fibonacci(nth - 2)
  end
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765