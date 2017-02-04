# require 'date'

# def word_cap(string)
#   p string.split.map { |word| word[0].capitalize + word[1..-1 ]}.join(' ')
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The JavaScript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# def friday_13th?(year)
#   fridays = 0

#   1.upto(12) do |month|
#     fridays += 1 if Date.new(year,month,13).friday?
#   end
#   p fridays
# end

# friday_13th?(2015)
# friday_13th?(1986)

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(words)

  words = rand(20)
  phrases = [NUMBERS.sample]
  words.times do
    phrases << OPERATORS.sample
    phrases << NUMBERS.sample
  end
  p phrases.join(' ').gsub("divided", "divided by")

end

mathphrase(1)
