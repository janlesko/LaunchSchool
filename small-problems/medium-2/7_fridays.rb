require 'date'

# def friday_13th?(year)
#   fridays = 0
#   Date.new(year, 1, 1).upto(Date.new(year, 12, 31)) do |date|
#     fridays += 1 if date.friday? && date.day == 13
#   end
#   p fridays
# end

def friday_13th?(year)
  count = 0
  (1..12).each { |month| count += 1 if Date.new(year, month, 13).friday? }
  count
end

# def friday_13th?(year)
#   fridays = 0
#   thirteen = Date.new(year, 1, 13)
#   12.times do
#     fridays += 1 if thirteen.friday?
#     thirteen = thirteen.next_month
#   end
#   p fridays
# end

friday_13th?(2015) == 3
friday_13th?(1986) == 1
friday_13th?(2019) == 2