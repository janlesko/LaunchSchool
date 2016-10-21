def caps(string)
  if string.length > 10
    puts string.upcase
  else
    puts string
  end
end

caps("hello world")