BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(word)
#   word = word.upcase
#   p BLOCKS.none? { |block| word.count(block) >= 2 }
# end

def block_word?(string)
  BLOCKS.each do |block|
    return false if string.upcase.count(block) > 1
  end  
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
