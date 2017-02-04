class MyCar

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
end

MyCar.gas_mileage(10, 300)