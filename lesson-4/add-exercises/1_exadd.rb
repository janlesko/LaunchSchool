flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

result = {}

flintstones.each_with_index do |name, index|
  result[name] = index + 1
end

p result