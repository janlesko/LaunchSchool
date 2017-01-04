# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

def running_total(array)
  result = []
  array.each_index do |i|
    result << array[0..i].inject(:+)
  end
  result
end

running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])