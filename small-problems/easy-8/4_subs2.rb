# def substrings(string)
#   result = []
#   string = string
#   loop do
#     string.size.times do |index|
#       result << string[0..index]
#     end
#     string.slice!(0)
#     break if string.size == 0
#   end
#   p result.sort
# end

def substrings_at_start(string)
  result = []
  0.upto(string.size - 1).each do |index|
    result << string[0..index]
  end
  p result
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results << (substrings_at_start(this_substring))
  end
  results
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]