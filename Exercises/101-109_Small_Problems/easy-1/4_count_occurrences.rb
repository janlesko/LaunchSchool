def count_occurrences(vehicles)
  hash = {}
  vehicles.uniq.each do |veh|
    hash[veh] = vehicles.count(veh)
  end

  hash.each do |k, v|
    puts "#{k} => #{v}"
  end
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
