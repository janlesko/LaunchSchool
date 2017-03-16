# def count(ary)
#   counter = 0
#   ary.each do |num|
#     counter += 1 if yield(num)
#   end
#   counter
# end

def count(ary)
  counter = 0
  ary.size.times { |idx| counter += 1 if yield(ary[idx]) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2