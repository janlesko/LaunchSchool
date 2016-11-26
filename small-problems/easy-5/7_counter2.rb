# def word_sizes(text)
#   hash = Hash.new(0)
#   text.gsub(/[^\w\s]/, "").split(' ').each do |word|
#     hash[word.size] += 1
#   end
#   p hash
# end

def word_sizes(word_string)
  count = Hash.new(0)
  word_string.split.each do |word|
    clean = word.delete('^A-Za-z')
    count[clean.size] += 1
  end
  count
end

# def word_sizes(string)
#   count_hash = Hash.new(0)
#   string.split.each do |word|
#     count_hash[word.count('a-zA-Z')] += 1
#   end
#   count_hash
# end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}