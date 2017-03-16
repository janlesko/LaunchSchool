class TextAnalyzer
  def process
    file = File.open('text_new.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count}" }
analyzer.process { |file| puts "#{file.split("\n").count} lines" }
analyzer.process { |file| puts "#{file.split(" ").count} words" }

# 3 paragraphs
# 25 lines
# 306 words