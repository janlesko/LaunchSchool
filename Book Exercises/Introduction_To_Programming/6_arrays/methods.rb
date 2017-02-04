def method(arr)
  arr.pop
end

def method2(arr)
  arr.select { |x| x > 2 }
end

array = [1, 2, 3, 4, 5]

puts method(array)
puts "---"
puts array
puts "---"
puts method2(array)