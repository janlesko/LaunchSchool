# def average(array)
#   result = 0
#   array.each { |num| result += num }
#   result / array.size
# end

def average(array)
  sum = array.reduce(:+).to_f
  (sum / array.count).round(1)
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])