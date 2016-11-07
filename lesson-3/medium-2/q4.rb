sentence = "Humpty Dumpty sat on a wall."

# puts sentence.split.reverse!.join(" ")

words = sentence.split(/\W/)
words.reverse!
puts backwards_sentence = words.join(' ') + '.'