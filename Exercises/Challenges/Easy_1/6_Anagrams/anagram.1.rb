class Anagram
  def initialize(string)
    @template_string = string
    @template_anagram_hash = get_anagram_hash(string)
  end
  
  def match(candidates)
    candidates.select { |candidate| match_template?(candidate) }
  end
  
  private
  
  def get_anagram_hash(input)
    anagram_hash = Hash.new(0)
    input.chars.each { |char| anagram_hash[char.downcase] += 1 }
    anagram_hash
  end
  
  def match_template?(candidate)
    return nil if candidate.downcase == @template_string.downcase 
    candidate_anagram_hash = get_anagram_hash(candidate)
    @template_anagram_hash == candidate_anagram_hash
  end
end

# def test_detect_simple_anagram
#     detector = Anagram.new('ant')
#     anagrams = detector.match(%w(tan stand at))
#     assert_equal ['tan'], anagrams
# end