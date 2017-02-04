def merge(ary1, ary2)
  index2 = 0
  result = []
  
  ary1.each do |value|
    while index2 < ary2.size && ary2[index2] <= value
      result << ary2[index2]
      index2 += 1
    end
    result << value
  end
  
  p result << ary2[index2..-1]
end

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]