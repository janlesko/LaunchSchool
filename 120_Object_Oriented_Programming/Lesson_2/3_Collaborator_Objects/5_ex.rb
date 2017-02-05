class Bulldog
  def speak
    "bark!"
  end
end

class Cat; end

class Person
  attr_accessor :pets
  
  def initialize
    @pets = []
  end
end

bob = Person.new
bul = Bulldog.new
kit = Cat.new

bob.pets << bul << kit

p bob.pets
p bob.pets.first.speak