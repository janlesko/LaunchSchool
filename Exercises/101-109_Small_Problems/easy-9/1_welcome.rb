# def greetings(ary, hsh)
#   puts "Hello, #{ary.join(' ')}! Nice to have a #{(hsh.values).join(' ')} around."
# end

def greetings(ary, hsh)
  puts "Hello, #{ary.join(' ')}! Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.