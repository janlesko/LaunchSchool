class PhoneNumber
  INVALID_NUMBER = '0000000000'

  attr_reader :phone_number

  def initialize(number)
    @phone_number = format(number)
  end

  def format(number)
    return INVALID_NUMBER if number =~ /[a-zA-Z]/
    number = number.gsub(/\D/, '')
    return INVALID_NUMBER if invalid?(number)
    number.size == 11 ? number[1..-1] : number
  end

  def invalid?(number)
    !number.size.between?(10, 11) || 
      (number.size == 11 && number[0] != '1')
  end

  def number
    phone_number
  end

  def area_code
    phone_number[0..2]
  end

  def central_office_code
    phone_number[3..5]
  end
  
  def line_code
    phone_number[6..9]
  end

  def to_s
    "(#{area_code}) #{central_office_code}-#{line_code}"
  end
end
