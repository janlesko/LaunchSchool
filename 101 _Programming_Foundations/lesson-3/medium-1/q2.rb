statement = "The Flintstones Rock"

=begin
occurence = {}
statement.split('').each do |letter| 
  if occurence.has_key?(letter)
    occurence[letter] += 1
  else
    occurence[letter] = 1
  end
end

p occurence
=end

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

