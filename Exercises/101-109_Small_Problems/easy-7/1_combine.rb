# def interleave(ary1, ary2)
#   result = []
#     ary1.size.times do |d|
#       result << ary1[d] << ary2[d]
#     end
#   p result
# end

# def interleave(ary1, ary2)
#   result = []
#   ary1.each_with_index do |element, index|
#     result << element << ary2[index]
#   end
#   p result
# end

def interleave(ary1, ary2)
  p ary1.zip(ary2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']