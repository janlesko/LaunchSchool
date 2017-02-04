class GoodDog
  DOG_YEARS = 7
  
  attr_accessor :name, :age
  
  def initialize(n, a)
    self.name = n
    self.age = DOG_YEARS * a
  end
  
  def to_s
    "This dog's name is #{name} and is #{age} in dog years"
  end
end

sparky = GoodDog.new("Sparky", 8)

puts sparky