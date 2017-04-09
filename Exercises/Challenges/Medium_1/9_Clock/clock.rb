# class Clock
#   def self.at(hours, minutes = 0)
#     hours * 60 + minutes
#   end
  
#   def -(minutes)
#     at - minutes
#   end
  
#   def +(minutes)
#     at + minutes
#   end
# end

# class Fixnum
#   def to_s
#     hours, minutes = (self % 1440).divmod(60)
#     format('%02d:%02d', hours, minutes)
#   end
# end

class Clock
  def initialize(hours, minutes)
    @total_minutes = hours * 60 + minutes
  end
  
  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end
  
  def -(minutes)
    @total_minutes -= minutes
    self
  end
  
  def +(minutes)
    @total_minutes += minutes
    self
  end
  
  def to_s
    hours, minutes = (@total_minutes % 1440).divmod(60)
    format('%02d:%02d', hours, minutes)
  end
  
  def ==(other_time)
    to_s == other_time.to_s
  end
end

clock = Clock.at(10) - 90
p clock.to_s