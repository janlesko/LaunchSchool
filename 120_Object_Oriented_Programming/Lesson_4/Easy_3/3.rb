class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

garen = AngryCat.new("Garen", 12)
xin = AngryCat.new("Xin", 1)