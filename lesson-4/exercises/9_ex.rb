arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

result = arr.sort_by do |arr2| 
  p arr2.select { |num| num.odd? }
end

p result
