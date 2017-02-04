def multisum(number)
  multiples = []
  (1..number).each { |num| multiples << num if num % 3 == 0 || num % 5 == 0 }
  multiples.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168