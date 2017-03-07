# def missing(ary)
#   full_array = (ary.first..ary.last).to_a
#   full_array - ary
# end

def missing(ary)
  result = []
  ary.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

