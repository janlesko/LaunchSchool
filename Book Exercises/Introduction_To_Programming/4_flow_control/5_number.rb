def method(num)
  case
  when num < 0
    puts "negative number"
  when num <= 50
    puts "#{num} is between 0 and 50"
  when num <= 100
    puts "#{num} is between 50 and 100"
  else
  puts "#{num} is above 100"
  end
end

puts "enter a number between 0 and 100"
number = gets.chomp.to_i

method(number)