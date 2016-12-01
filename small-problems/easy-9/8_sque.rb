# def sequence(count, first)
#   result = []
#   sum = 0
#   count.times do
#     sum += first
#     result << sum
#   end
#   p result
# end

def sequence(count, first)
  p (1..count).map { |idx| idx * first }
end

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []