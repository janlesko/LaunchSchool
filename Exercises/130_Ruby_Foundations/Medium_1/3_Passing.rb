def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Let's start gathering food."
end

items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) { |item| puts "#{item.join(', ')}" }
