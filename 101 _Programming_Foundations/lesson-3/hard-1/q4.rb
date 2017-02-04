def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |letter| characters << letter }

  uuid = ''
  section = [8, 4, 4, 4, 12]
  section.each_with_index do |sec, index|
    sec.times { uuid += characters.sample }
    uuid += '-' unless index >= section.size - 1
  end
  uuid
end

puts generate_UUID