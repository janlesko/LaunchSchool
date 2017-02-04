def median(ary)
  ary.sort!
  middle = ary.size / 2
  if ary.size.odd?
    ary[middle]
  else
    (ary[middle - 1] + ary[middle]) / 2
  end
end
  
  
# median = middle value of the array if array.size.odd
# median = if array.size.even
#   sum two middle element / 2

p median([1, 9, 33, 4, -2, 3])
p median([86])
p median([1, 33, 5, -2, 33])
p median([18, 66, 33, 4, -2, -3])
p median([-1, -4, -2])
p median([47, 33, 90, -2, 883])