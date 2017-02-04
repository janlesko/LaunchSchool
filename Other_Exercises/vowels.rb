VOWELS = %w(a e i o u)

def remove_vowels(ary)
  ary.map do |word| 
    p chars = word.split('')
    VOWELS.each { |vowel| chars.delete(vowel) }
    p chars.join('')
  end
end


list = ['green', 'yellow', 'black', 'white']
remove_vowels(list)