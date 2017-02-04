# def substrings_at_start(string)
#   ary = string.chars
#   p ary.each_index.map { |i| ary[0..i].join }
# end

# def substrings_at_start(string)
#   ary = string.chars
#   counter = 1
#   result = []
#   while counter <= ary.size
#     result << ary.first(counter).inject(:+)
#     counter += 1
#   end
#   p result
# end

def substrings_at_start(string)
  result = []
  string.size.times do |index|
    result << string[0..index]
  end
  p result
end

substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']