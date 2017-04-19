class Robot
  attr_reader :name
  
  @@all_names = []
  
  def initialize
    @name = generate_name
    initialize if @@all_names.include?(@name)
    @@all_names << @name
  end
  
  def generate_name
    ('AA'..'ZZ').to_a.sample + ('000'..'999').to_a.sample
  end
  
  def reset
    @@all_names.delete(@name)
    @name = generate_name
    @@all_names << @name
  end
end
