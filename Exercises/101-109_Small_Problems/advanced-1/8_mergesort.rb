def merge_sort(ary)
  return ary if ary.size == 1
  
  sub_array1 = ary[0...ary.size / 2]
  sub_array2 = ary[ary.size / 2...ary.size]
  
  sub_array1 = merge_sort(sub_array1)
  sub_array2 = merge_sort(sub_array2)
  
  p sub_array1
  p sub_array2
  
  # merge(sub_array1, sub_array2)  
end

# def merge(ary1, ary2)
#   result = []
#   index2 = 0
  
#   ary1.each do |num|
#     while index2 < ary2.size && ary2[index2] 
# end

merge_sort([9, 5, 7, 1])