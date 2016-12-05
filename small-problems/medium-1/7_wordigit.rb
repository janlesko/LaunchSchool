# DIGIT_WORDS = %w(zero one two three four five six seven eight nine)

# def word_to_digit(string)
#   array = string.split(/\b/)
#   p array
#   output = array.map do |word|
#     DIGIT_WORDS.include?(word) ? DIGIT_WORDS.index(word) : word
#   end

#   p output.join
# end

# DIGIT_WORDS = %w(zero one two three four five six seven eight nine)

# def word_to_digit(string)
#   DIGIT_WORDS.each_with_index do |word, index|
#     string.gsub!(word, "#{index}")
#   end
#   p string
# end

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eigth' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.each do |word,number|
    words.gsub!(/\b#{word}\b/i, number)
  end

  words.gsub!(/(\d)\s/, '\1')

  p words
end

word_to_digit('Please call me at five five five one two three Four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
