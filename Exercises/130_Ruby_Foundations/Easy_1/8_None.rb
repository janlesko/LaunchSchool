# def none?(ary)
#   ary.each do |num|
#     return false if yield(num)
#   end
#   true
# end

def none?(ary, &block)
  !any?(ary, &block)
end

def any?(ary)
  ary.each do |num|
    return true if yield(num)
  end
  false
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true