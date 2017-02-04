module Mammal
  def self.some_out_of_place_method(num)
    num ** 2
  end
end

puts Mammal.some_out_of_place_method(4)

puts Mammal::some_out_of_place_method(7)