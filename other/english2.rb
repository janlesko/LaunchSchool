WORDS = %w(zero one two three four five six seven eigth nine)

def computer(english)
  english = english.sub('divided by', 'divided_by')
  array = english.split(' ').map do |word|
    word = WORDS.index(word) if WORDS.include?(word)
    word
  end

  loop do
    break if !array.include?('times') && !array.include?('divided_by')

    index_of_op = array.index('divided_by') || array.index('times')
    first = array[index_of_op - 1]
    action = array[index_of_op]
    second = array[index_of_op + 1]

    solution = case action
               when 'times'      then first * second
               when 'divided_by' then first / second
    end

    array.delete_at(index_of_op - 1)
    array.delete_at(index_of_op - 1)
    array[index_of_op - 1] = solution
  end

  loop do 
    num1, action, num2 = array.shift(3)
    first, second = num1, num2

    case action
    when 'plus' then       array.unshift(first + second)
    when 'minus' then      array.unshift(first - second)
    when 'times' then      array.unshift(first * second)
    when 'divided_by' then array.unshift(first / second)
    end
    break if array.size == 1
  end

  array.first
end

# p computer ('two plus two')
# p computer ('seven minus seven')
# p computer ('zero plus eigth')
# p computer ('two plus two minus three')
# p computer ('three minus one plus five minus four plus one plus one minus six')

p computer('eigth times four plus six divided by two minus two')
p computer('nine times four plus two minus eigth')

