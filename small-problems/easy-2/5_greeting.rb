# puts "What is your name?"
# name = gets.chomp

# if name.include?("!")
#   puts "HELLO #{name.upcase.delete("!")}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
