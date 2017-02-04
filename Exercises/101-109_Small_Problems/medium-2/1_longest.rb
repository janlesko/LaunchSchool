# def longest_sentense(text)
#   sentense_length = text.split(/[.?!]/).map do |sentense|
#     sentense.split(" ").size
#   end
#   p sentense_length.sort.last
# end

# text = File.read("pg84.txt")

# longest_sentense(text)

text = File.read('pg84.txt')
sentences = text.split(/[.?!]/)
largest_sentence = sentences.max_by { |sentense| sentense.split.size }
largest_sentence = largest_sentence.strip

words_number = largest_sentence.split.size

longest_word = text.split(/\W/).max_by { |word| word.size }


puts "#{largest_sentence}"
puts "Contains #{words_number} words"
puts "Longest word is: #{longest_word}"
