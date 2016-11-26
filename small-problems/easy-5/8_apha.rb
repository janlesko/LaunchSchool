# TRANSLATE = { 0 => 'zero', 1 => 'one', 2 => 'two', 
#               3 => 'three', 4 => 'four', 5 => 'five' }

# def alphabetic_number_sort(numbers)
#   words = numbers.map { |num| TRANSLATE[num] }.sort
#   p words.map { |word| TRANSLATE.key(word) }
# end

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(numbers)
#   p numbers.sort_by { |num| NUMBER_WORDS[num] }
# end

def alphabetic_number_sort(numbers)
  number.sort { |x, y| NUMBER_WORDS[x] <=> NUMBER_WORDS[y] }
end

alphabetic_number_sort((0..19).to_a)


