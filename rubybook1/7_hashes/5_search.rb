person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

person.each_value { |v| puts v if v == "Bob" }

if person.has_value?("Bob")
  puts "Match!"
else
  puts "No match!"
end