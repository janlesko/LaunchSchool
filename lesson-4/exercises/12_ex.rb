arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]

result = []

arr.each do |ele|
  if ele.class == String
    result << ele
  else
    ele.each do |ele1|
      if ele1.class == String
        result << ele1
      else
        ele1.each do |ele2|
          result << ele2
        end
      end
    end
  end
end
  

p result