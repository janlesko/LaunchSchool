# def select_fruit(hash)
#   hash.select do |key, value|
#     hash[key] if value == "Fruit"
#   end
# end

def select_fruit(hash)
  keys = hash.keys
  counter = 0
  selected = {}
  
  loop do
    break if counter == keys.size
    
    current_key = keys[counter]
    current_value = hash[current_key]
    
    if current_value == "Fruit"
      selected[current_key] = current_value
    end
    
    counter += 1
  end
  
  selected
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}