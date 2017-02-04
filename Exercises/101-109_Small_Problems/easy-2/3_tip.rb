puts "What is the bill?"
bill = 200

puts "What is the tip percentage?"
percentage = 15

tip = (bill * percentage / 100).round(2)
total = (bill + tip).round(2)

puts "The tip is $%.2f" %[tip]
puts "The total is $%.2f" %[total]
