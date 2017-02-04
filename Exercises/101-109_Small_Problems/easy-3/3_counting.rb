puts "Please write word or multiple words."
string = gets.chomp

char = string.delete(' ').size

puts "There are #{char} characters in \"#{string}\""