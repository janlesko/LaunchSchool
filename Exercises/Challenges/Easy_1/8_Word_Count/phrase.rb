class Phrase
  def initialize(string)
    @string = string.split(/[\s,]/)
                    .select { |word| word.match(/[a-zA-Z0-9]/) }
                    .map { |word| transform_word(word) }
  end
  
  def word_count
    result = Hash.new(0)
    @string.each do |word|
      result[word] += 1
    end
    result
  end
  
  def transform_word(word)
    word.gsub(/[^a-zA-Z0-9']|^'|'$/, "").downcase
  end
end

# class Phrase
#   def initialize(string)
#     @string = string
#   end
  
#   def word_count
#     result = Hash.new(0)
#     @string.scan(/\b[\w']+\b/) do |word|
#       result[word] += 1
#     end
#     result
#   end
# end

Phrase.new("one of each").word_count