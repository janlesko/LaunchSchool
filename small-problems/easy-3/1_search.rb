# puts "Enter the 1st number:"
# first = gets.chomp.to_i

# puts "Enter the 2nd number:"
# second = gets.chomp.to_i

# puts "Enter the 3rd number:"
# third = gets.chomp.to_i

# puts "Enter the 4th number:"
# fourth = gets.chomp.to_i

# puts "Enter the 5th number:"
# fifth = gets.chomp.to_i

# puts "Enter the last number:"
# last = gets.chomp.to_i

# collection = []
# collection << first << second << third << fourth << fifth

# if collection.include?(last)
#   puts "The number #{last} appears in #{collection}."
# else
#   puts "The number #{last} does not appear in #{collection}."
# end

collection = []

5.times do |index|
  puts "Enter number #{index+1}:"
  collection << gets.chomp.to_i
end

puts "Enter the last number:"
last = gets.chomp.to_i

if collection.include?(last)
  puts "The number #{last} appears in #{collection}."
else
  puts "The number #{last} does not appear in #{collection}."
end
  