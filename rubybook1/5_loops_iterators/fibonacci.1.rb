def fibonacci(number)
    fibonacci(number - 1) + fibonacci(number - 2)
end

puts fibonacci(5)