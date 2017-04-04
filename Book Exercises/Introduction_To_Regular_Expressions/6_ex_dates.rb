# def format_date(string)
#   string.gsub(/\-/, ".")
# end

def format_date(string)
  string.gsub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\1.\2.\3')
end
  

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)