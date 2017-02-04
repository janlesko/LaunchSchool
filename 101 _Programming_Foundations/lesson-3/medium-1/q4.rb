numbers = [1, 2, 3, 4, 5]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  p numbers.shift(1)
end

numbers = [1, 2, 3, 4, 5]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  p numbers.pop(1)
end