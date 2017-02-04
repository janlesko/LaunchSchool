def print_list(array, first = 1)
  counter = first
  array.each do |item|
    puts "#{counter}. #{item}"
    counter = counter.next
  end
end

print_list(["Ruby", "Python", "Scala"], 23)

####################################################

def print_list(array, first = 1)
  counter = first
  array.each do |item|
    puts "#{yield counter} #{item}"
    counter = counter.next
  end
end

print_list(["Ruby", "Python", "Scala"], 23) { |n| "(#{n})" }

print_list(["Ruby", "Python", "Scala"], 23) { |n| "<#{n}>" }
