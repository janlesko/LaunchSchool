puts "Enter a 4 digit number"
number = gets.chomp.to_i

puts "Which digit would like to return: 1st, 2nd, 3rd or 4th?"
digit = gets.chomp

if digit == "1st"
  result = number / 1000
elsif digit == "2nd"
  result = number % 1000 / 100
elsif digit == "3rd"
  result = number % 1000 % 100 / 10
elsif digit == "4th"
  result = number % 1000 % 100 % 10
else
  result = "error"
end

puts result
  