def add(a,b)
  a + b
end

def subtract(a,b)
  a - b
end

def multiply(a,b)
  a * b
end

puts "#{multiply(add(20,23),subtract(23,11))}"

puts "#{add(subtract(20,12), multiply(add(20,23),subtract(23,11)))}"