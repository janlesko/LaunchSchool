array = [1, 2, 3, 4, 5]

array.select { |num| num.odd? }       # => [1, 3, 5]
array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
array.select { |num| num + 1 }

##########################################

def select(ary)
  counter = 0
  selected = []
  
  while counter < ary.size
    selected << ary[counter] if yield(ary[counter])
    counter += 1
  end
  
  selected
end
select([1, 2, 3, 4, 5]) { |num| num.odd? }
select([1, 2, 3, 4, 5]) { |num| puts num }
select([1, 2, 3, 4, 5]) { |num| num + 1 }