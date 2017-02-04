# def sequence(num)
#   counter = num
#   result = []
#   until counter == 0
#     result.unshift(counter)
#     counter -= 1
#   end
#   p result
# end

def sequence(number)
  p number < 0 ? (number..1).to_a : (1..number).to_a
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
sequence(-1)
sequence(-5)