module Swimable
  def swim
    "I'm swimming"
  end
end

class Animal; end
  
class Fish < Animal
  include Swimable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimable
end

puts Dog.new.swim
puts Fish.new.swim