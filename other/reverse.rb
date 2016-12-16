def reverse(string)
  reversed = string.split.map.with_index do |word, index|
    word = index.odd? ? word.reverse! : word
  end
  reversed << reversed.pop(2).join
  p reversed.join(' ')
end

p reverse("whats  the matter   with kansas .") == "whats eht matter htiw kansas."

# input:
#   1 - many words
#   seperated by 1 - many spaces
#   termindated by
#     0 - many spaces
#     followed by a point
#   charsL letter, space, point, up to 20 letters
#   need to handle failure?

# output: 
#   words: every odd word reversed
#   words separated by single space
#   last character is point
