statement = "The Flintstones Rock"

frequencies = Hash.new(0)

statement.chars.each do |char|
  next if char == " "
  frequencies[char] += 1
end

p frequencies