# def sum(int)
#   int.to_s.chars.map(&:to_i).inject(:+)
# end

def sum(num)
  total = 0
  num.to_s.chars{ |n| total += n.to_i }
  total
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45