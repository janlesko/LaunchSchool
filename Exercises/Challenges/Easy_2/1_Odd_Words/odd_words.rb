def odd_words(string)
  string = string.delete(".").strip + "."
  string.split.each_with_index do |word, index|
    if index.odd?
      print word.reverse + " "
    else
      print word + " "
    end
  end
end

string1 = "whats the matter with kansas."
string2 = "whats the  matter    with kansas  ."

odd_words(string1)
odd_words(string2)
odd_words("hello  .  ")
