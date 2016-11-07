def generate_UUID
  characters = []
  (1..9).each { |number| characters << number.to_s }
  ('a'..'f').each { |letter| characters << letter}

  uuid = ''
  sections = [8, 4, 4, 4, 12]

  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' if index < 4
  end

  uuid
end

puts generate_UUID
