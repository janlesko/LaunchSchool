# def letter_percentages(string)
#   uppercase_count = 0
#   lowercase_count = 0
#   neither_count = 0
#   string.chars.each do |char|
#     if char =~ /[a-z]/
#       lowercase_count += 1
#     elsif char =~ /[A-Z]/
#       uppercase_count += 1
#     else
#       neither_count += 1
#     end
#   end
#   p generate_hash(uppercase_count, lowercase_count, neither_count)
# end

# def generate_hash(uppercase_count, lowercase_count, neither_count)
#   sum = uppercase_count + lowercase_count + neither_count
#   hash = Hash.new(0)
#   hash[:lowercase] = 100 * lowercase_count / sum.to_f
#   hash[:uppercase] = 100 * uppercase_count / sum.to_f
#   hash[:neither] = 100 * neither_count / sum.to_f
#   hash
# end

#########################

# def letter_percentages(string)
#   counts = { lowercase: 0, uppercase: 0, neither: 0}
#   percentages = { lowercase: [], uppercase: [], neither: [] }
#   characters = string.chars
#   length = string.length

#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/ }

#   calculate(percentages, counts, length)

#   p percentages
# end

# def calculate(percentages, counts, length)
#   percentages[:uppercase] = (counts[:uppercase] / length.to_f ) * 100
#   percentages[:lowercase] = (counts[:lowercase] / length.to_f ) * 100
#   percentages[:neither] = (counts[:neither] / length.to_f ) * 100
# end

##########################

def letter_percentages(str)
  { lowercase: str.count('a-z').to_f / str.length * 100,
    uppercase: str.count('A-Z').to_f / str.length * 100,
    neither: str.count('^a-z', '^A-Z').to_f / str.length * 100 }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }