def reduce(array, default=0)
  counter = 0
  acc = default
  while counter < array.size
    num = array[counter]
    acc = yield(acc, num)
    counter += 1
  end
  p acc
end



array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }   

