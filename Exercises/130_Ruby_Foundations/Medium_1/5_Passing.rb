def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) do |*non_wheat, wheat|
  puts non_wheat.join(', ')
  puts wheat
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |apples,*veg,wheat|
  puts apples
  puts veg.join(', ')
  puts wheat
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |fruit,*non_fruit|
  puts fruit
  puts non_fruit.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |apples,corn,cabbage,wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!