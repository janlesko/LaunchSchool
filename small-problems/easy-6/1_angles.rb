# def dms(input)
#   degrees = input.to_i
#   minutes = ((input - degrees) * 60).round(2).to_i
#   seconds = ((((input - degrees) * 60).round(2) - minutes).round(2) * 60).to_i
#   format(%(#{degrees}°%02d'%02d"), minutes, seconds)
# end

def dms(degrees_float)
  degrees_float = degrees_float + 360 if degrees_float < 0
  total_seconds = (degrees_float * 60 * 60).round
  degrees, remaining_seconds = total_seconds.divmod(60*60)
  minutes, seconds = remaining_seconds.divmod(60)
  format(%(#{degrees}°%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(-30)
