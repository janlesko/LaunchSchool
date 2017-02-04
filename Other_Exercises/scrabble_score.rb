def scrabble_score(word)
  score = 0
  word.chars.each do |char|
    case char.downcase
    when 'd', 'g'                then score += 2
    when 'b', 'c', 'm', 'p'      then score += 3
    when 'h', 'f', 'v', 'w', 'y' then score += 4
    when 'k'                     then score += 5
    when 'j', 'x'                then score += 8
    when 'q', 'z'                then score += 10
    else                              score += 1
    end
  end
  p score
end

scrabble_score("hello") == 8
scrabble_score("")
