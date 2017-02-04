class SocialSecurity
  attr_accessor :ssn
  
  def initialize(ssn)
    @ssn = ssn
  end
  
  def ssn
    'xxx-xx-' + @ssn.split('-').last
  end
  
  def output_ssn
    "hidden ssn is: #{ssn}"
  end
end

number = SocialSecurity.new("123-45-6789")

puts number.output_ssn