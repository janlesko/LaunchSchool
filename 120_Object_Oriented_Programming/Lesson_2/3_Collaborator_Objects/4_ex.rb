class Bulldog
  def speak
    "bark!"
  end
end

class Person
  attr_accessor :name, :pet
end

bob = Person.new
bul = Bulldog.new

p bul.speak

bob.pet = bul

p bob.pet.speak