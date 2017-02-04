uuid_values = (1..9).to_a + ('a'..'f').to_a

uuid = ''
sections = [8, 4, 4, 4, 12]

sections.each do |section|
  section.times do
    uuid += uuid_values.sample.to_s
  end
  uuid += "-" if uuid.size < 32
end

p uuid