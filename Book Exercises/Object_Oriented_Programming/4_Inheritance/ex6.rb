module Flyable
  def flying
    "I can take off to air"
  end
end

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@object_number = 0
  
  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@object_number += 1
  end
  
  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end
  
  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelareto #{number} mph."
  end
  
  def current_speed
    puts "You are now going #{@current_speed} mph."
  end
  
  def shut_down
    puts "Let's park this bad boy!"
  end
  
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def self.display_object_number
    @@object_number
  end
  
  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
  
  def age
    "Your #{self.model} is #{years_old} years old."
  end
  
  private
  
  def years_old
    Time.now.year - year 
  end
end

class MyCar < Vehicle
  include Flyable
  
  NUMBER_OF_DOORS = 4
  
  def to_s
    "My car is a #{color}, #{year}, #{model}!"
  end
end

class MyTruck < Vehicle
  include Towable
  
  NUMBER_OF_DOORS = 2
  
  def to_s
    "My truck is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')

puts lumina.age
