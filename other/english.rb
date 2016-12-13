WORDS = %w(zero one two three four five six seven eigth nine)

def computer(english)
  array = english.split(' ')

  loop do 
    num1, action, num2 = array.shift(3)
    first, second = WORDS.index(num1), WORDS.index(num2)

    case action
    when 'plus' then  array.unshift(WORDS[first + second])
    when 'minus' then array.unshift(WORDS[first - second])
    end
    break if array.size < 2
  end

  WORDS.index(array.first)
end

p computer ('two plus two')
p computer ('seven minus seven')
p computer ('zero plus eigth')
p computer ('two plus two minus three')
p computer ('three minus one plus five minus four plus one plus one minus six')

