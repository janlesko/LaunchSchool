# def triangle
#   puts "#{" " * 4 + "*" * 1}"
#   puts "#{" " * 3 + "*" * 2}"
#   puts "#{" " * 2 + "*" * 3}"
#   puts "#{" " * 1 + "*" * 4}"
#   puts "#{" " * 0 + "*" * 5}"
# end

# def triangle
#   puts "#{" " * 0 + "*" * 5}"
#   puts "#{" " * 1 + "*" * 4}"
#   puts "#{" " * 2 + "*" * 3}"
#   puts "#{" " * 3 + "*" * 2}"
#   puts "#{" " * 4 + "*" * 1}"
# end

# def triangle(size)
#   spaces = size - 1
#   stars = 1

#   while stars <= size do
#     puts "#{" " * spaces + "*" * stars}"
#     spaces -= 1
#     stars += 1
#   end
# end

# def triangle(size)
#   spaces = 0
#   stars = size

#   size.times do
#     puts "#{" " * spaces + "*" * stars}"
#     spaces += 1
#     stars -= 1
#   end
# end

def triangle(num)
  (1..num).each { |x| puts ('*' * x).rjust(num, ' ') }
end

triangle(9)
