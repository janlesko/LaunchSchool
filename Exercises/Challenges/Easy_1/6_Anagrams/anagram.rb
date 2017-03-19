# class Anagram
#   def initialize(anagram)
#     @anagram = anagram
#   end
  
#   def match(ary)
#     ary.select do |candidate|
#       next if @anagram.downcase == candidate.downcase
#       sorted(@anagram) == sorted(candidate)
#     end
#   end
  
#   private
  
#   def sorted(string)
#     string.downcase.chars.sort.join
#   end
# end

# class Anagram
#   def initialize(word)
#     @word = word
#   end
  
#   def match(words)
#     words.select { |word| anagram?(word, @word) }
#   end
  
#   private
  
#   def anagram?(word1, word2)
#     return false if word1.downcase == word2.downcase
#     word1.downcase.chars.sort == word2.downcase.chars.sort
#   end
# end

class Anagram
  def initialize(word)
    @word = word
  end
  
  def match(words)
    words.select { |word| anagram?(word, @word) }
  end
  
  private
  
  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    hash1 = letter_counter(word1)
    hash2 = letter_counter(word2)
    hash1 == hash2
  end
  
  def letter_counter(word)
    hash = Hash.new(0)
    word.chars.each { |char| hash[char.downcase] += 1 }
    hash
  end
end

detector = Anagram.new('diaper')
p detector.match(%w(hello world zombies pants))

detector = Anagram.new('Ant')
p detector.match(%w(Tan stand at))

