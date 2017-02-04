# def print_in_box(text)
#   puts "+-#{"-" * text.length}-+"
#   puts "| #{" " * text.length} |"
#   puts "| #{text} |"
#   puts "| #{" " * text.length} |"
#   puts "+-#{"-" * text.length}-+"
# end

def print_in_box(message)
  horizonal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizonal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizonal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')