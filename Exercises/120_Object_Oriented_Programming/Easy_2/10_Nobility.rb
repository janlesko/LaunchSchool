module Walkable
  def walk
    puts "#{self} #{gait} fowrard."
  end
end

class Person
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end


class Cat
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def to_s
    name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title
  
  include Walkable
  
  def initialize(name, title)
    @name = name
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end
  
  private
  
  def gait
    "strunts"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
puts byron.name
#=> "Byron"
puts byron.title
#=> "Lord"