puts 'enter first number'
first_number = gets.chomp

puts 'enter second number'
second_number = gets.chomp

puts 'select action: 1) add 2) subtract 3) mutliply 4) divide'
action = gets.chomp

if action == '1'
  result = first_number.to_i + second_number.to_i
elsif action == '2'
  result = first_number.to_i - second_number.to_i
elsif action == '3'
  result = first_number.to_i * second_number.to_i
else
  result = first_number.to_f / second_number.to_f
end

puts result.to_s