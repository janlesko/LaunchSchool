# def crunch(string)
#   result = []
#   string.chars.each_index do |index|
#     result << string[index] if string[index] != string[index + 1]
#   end
#   result.join
# end

# def crunch(string)
#   array = []
#   string.each_char { |x| array.push(x) unless array.last == x }
#   array.join
# end

# def crunch(string)
#   chars = string.chars.uniq
#   chars.each do |char|
#     string.gsub!(/#{char}{2,}/, char)
#   end
#   string
# end

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''