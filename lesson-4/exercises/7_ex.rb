arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new = arr.map do |arr2|
  arr2.select do |num|
    num % 3 == 0
  end
end

p new