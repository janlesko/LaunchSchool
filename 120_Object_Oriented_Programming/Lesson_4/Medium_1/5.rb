class Television
  def self.manufacturer
    puts "man"
  end

  def model
    puts "mod"
  end
end

tv = Television.new
# tv.manufacturer
tv.model

Television.manufacturer
# Television.model