class Luhn
  def initialize(number)
    @number = number
  end
  
  def addends
    result = []
    @number.to_s.chars.reverse.each_with_index do |num, index|
      if index.odd?
        num = num.to_i * 2
        num -= 9 if num > 9
        result.unshift(num)
      else
        result.unshift(num.to_i)
      end
    end
    result
  end
  
  def checksum
    addends.inject(:+)
  end
  
  # def self.create(number)
  #   (0..9).each do |add|
  #     number = (number.to_s + add.to_s).to_i
  #     potential = new(number)
  #     break if potential.valid?
  #     number = number.to_s[0..-2].to_i
  #   end
  #   number
  # end
  
  def self.create(number)
    if new(number * 10).valid?
      number * 10
    else
      luhn_remainder = new(number * 10).checksum % 10
      number * 10 + (10 - luhn_remainder)
    end
  end
  
  def valid?
    checksum % 10 == 0
  end
end

# luhn = Luhn.new(123)
p Luhn.create(837_263_756)