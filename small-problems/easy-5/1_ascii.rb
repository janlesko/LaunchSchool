def ascii_value(string)
  sum = 0
  string.chars.each { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

p "a".ord.chr == "a"
