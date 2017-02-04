def reverse_words(words)
  new = words.split.each do |word| 
    word.reverse! if word.size >= 5
  end
  new.join (' ')
end

# def reverse_words(string)
#   words = []
  
#   string.split.each do |word|
#     word.reverse! if word.size >= 5
#     words << word
#   end
  
#   words.join(' ')
# end

# def reverse_words(sentence)
#   reversed_sentence = sentence.split.each do |word|
#     word.reverse! if word.size >= 5
#   end
#   reversed_sentence.join(' ')
# end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
