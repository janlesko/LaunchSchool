# def letter_case_count(string)
#   counter = {lowercase: 0, uppercase: 0, neither: 0}
#   letters = ('a'..'z').to_a
#   string.chars.each do |char|
#     if !letters.include?(char.downcase)
#       counter[:neither] += 1
#     elsif char.downcase == char
#       counter[:lowercase] += 1
#     elsif char.upcase == char
#       counter[:uppercase] += 1
#     end
#   end
#   p counter
# end

# def letter_case_count(str)
#   { lowercase: str.count('a-z'),
#     uppercase: str.count('A-Z'),
#     neither: str.count('^a-z','^A-Z') }
# end

# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   p counts
# end

def letter_case_count(string)
  counts = {}
  counts[:lowercase] = string.count('a-z')
  counts[:uppercase] = string.count('A-Z')
  counts[:neither] = string.count('^A-Za-z')
  p counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }