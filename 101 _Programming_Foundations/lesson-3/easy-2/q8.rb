flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#index = 0
#p flintstones.each_with_index { |n, i| index = i if n.include? "Be" }

puts flintstones.index { |name| name[0, 2] == "Be" }

puts flintstones[0][1, 3]

