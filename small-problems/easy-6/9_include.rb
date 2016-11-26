# def include?(array, search_value)
#   array.each do |num| 
#     return true if num == search_value
#   end
#   false
# end

# def include?(array, value)
#   !!array.index(value)
# end

def include?(array, value)
  array.count(value) == 1
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false