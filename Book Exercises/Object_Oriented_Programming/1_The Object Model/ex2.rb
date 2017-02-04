# What is a module? - Module is a collection of behaviors
# What is its purpose? - Define a set of behaviours that can be easily mixed into 
# specified classes
# How do we use them with our classes? - We mixed them with a class using 'include' 
# reserved word

module Poisonous
  def poison(flower)
    puts "Eat #{flower} and you may die!"
  end
end

class Flowers
  include Poisonous
end

poppy = Flowers.new

poppy.poison("poppy")