puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire = gets.chomp.to_i

year = Time.now.year

retire_age = retire - age + year

puts "It's #{year}. You will retire in #{retire_age}"
puts "You have only #{retire - age} years of work to go!"
