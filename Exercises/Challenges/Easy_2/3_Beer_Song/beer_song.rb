# class BeerSong
#   def lyrics
#     self.verse(99, 0)
#   end
  
#   def verses(from, to)
#     self.verse(from, to)
#   end

#   def verse(from, to = from)
#     string = ''
#     from.downto(to) do |verse|
#       if verse == 0
#         string += bottle_0
#       elsif verse == 1
#         string += bottle_1
#       elsif verse == 2
#         string += bottle_2
#       else
#         string += "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" \
#                   "Take one down and pass it around, #{verse - 1} bottles of beer on the wall.\n" \
#                   "\n"
#       end
#     end
#     string.chomp
#   end
  
#   def bottle_2
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#     "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
#     "\n"
#   end
  
#   def bottle_1
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#     "Take it down and pass it around, no more bottles of beer on the wall.\n" \
#     "\n"
#   end
  
#   def bottle_0
#     "No more bottles of beer on the wall, no more bottles of beer.\n" \
#     "Go to the store and buy some more, 99 bottles of beer on the wall.\n" \
#     "\n"
#   end
# end

################################################################################

# class BeerSong
#   class NoBottles
#     def verse _
#       <<~VERSE
#         No more bottles of beer on the wall, no more bottles of beer.
#         Go to the store and buy some more, 99 bottles of beer on the wall.
#       VERSE
#     end
#   end

#   class OneBottle
#     def verse _
#       <<~VERSE
#         1 bottle of beer on the wall, 1 bottle of beer.
#         Take it down and pass it around, no more bottles of beer on the wall.
#       VERSE
#     end
#   end

#   class TwoBottles
#     def verse _
#       <<~VERSE
#         2 bottles of beer on the wall, 2 bottles of beer.
#         Take one down and pass it around, 1 bottle of beer on the wall.
#       VERSE
#     end
#   end

#   class NBottles
#     def verse number
#       left = number - 1

#       <<~VERSE
#         #{number} bottles of beer on the wall, #{number} bottles of beer.
#         Take one down and pass it around, #{left} bottles of beer on the wall.
#       VERSE
#     end
#   end

#   BOTTLE_CLASSES = [NoBottles, OneBottle, TwoBottles].freeze

#   def verse(number)
#     bottles_class = BOTTLE_CLASSES.fetch(number, NBottles)
#     bottles_class.new.verse(number)
#   end

#   def verses(first_verse, last_verse)
#     first_verse.downto(last_verse).map { |number| verse(number) }.join("\n")
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

class BeerSong
  class NoBottles
    def verse(_)
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  class OneBottle
    def verse(_)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class TwoBottles
    def verse(_)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class NBottles
    def verse(num)
      left = num - 1
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{left} bottles of beer on the wall.\n"
    end
  end

  BOTTLE_CLASSES = { 0 => NoBottles, 1 => OneBottle, 2 => TwoBottles,
                     3..99 => NBottles }

  # def verse(num)
  #   BOTTLE_CLASSES.select { |b_cls| b_cls === num }.values.first.new.verse(num)
  # end

  def verse(num)
    BOTTLE_CLASSES.find{ |b_cls, _| b_cls === num }.last.new.verse(num)
  end

  def verses(first_verse, last_verse)
    first_verse.downto(last_verse).map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

puts BeerSong.new.verse(0)