def after_midnight(time)
  # hours = time[0..1].to_i
  # minutes = time[3..4].to_i
  hours, minutes = time.split(':').map(&:to_i)
  (hours * 60 + minutes) % 1440
end

def before_midnight(time)
  delta_minutes = 1440 - after_midnight(time)
  delta_minutes = 0 if delta_minutes == 1440
  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
