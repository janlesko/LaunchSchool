def merge_sort(ary)
  return ary if ary.size == 1
  
  sub_array1 = ary[0...ary.size / 2]
  sub_array2 = ary[ary.size / 2...ary.size]
  
  sub_array1 = merge_sort(sub_array1)
  sub_array2 = merge_sort(sub_array2)
  
  puts "#{sub_array1} sub one"
  puts "#{sub_array2} sub two"
  
  merge(sub_array1, sub_array2)  
end

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

p merge_sort([1, 5, 3, 4])
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))