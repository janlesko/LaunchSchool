# def zip(ary1, ary2)
#   result = []
#   ary1.size.times do |idx|
#     result << [ary1[idx], ary2[idx]]
#   end
#   result
# end

def zip(ary1, ary2)
  ary1.map.with_index { |ele1, idx| [ele1, ary2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]