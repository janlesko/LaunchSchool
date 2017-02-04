# def stringy(num)
# array = []
# num.times do
#   array << '1'
#   array << '0'
# end
# array.first(num).join
# end

def stringy(size, start=1)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.unshift(numbers.pop) if start == 0 
  numbers.join
end

puts stringy(6, 0)
