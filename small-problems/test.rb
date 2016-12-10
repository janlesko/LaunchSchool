# def substrings(string)
#   result = []
#   until string == ""
#     result << substrings_at_start(string)
#     string.delete!(string[0])
#   end
#   result
# end

def substrings(str)
  return [str] if str.length == 1
  substrings_at_start(str) + substrings(str[1..-1])
end

def substrings_at_start(string)
  result = []

  string.size.times do |x|
    result << string[0..x]
  end

p result
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]