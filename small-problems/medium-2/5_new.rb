def letter_percentages(string)
  hash = { lowercase: string.count('a-z').to_f / string.size * 100,
    uppercase: string.count('A-Z').to_f  / string.size * 100,
    neither: string.count('^a-z', '^A-Z').to_f  / string.size * 100 }
  p hash
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }