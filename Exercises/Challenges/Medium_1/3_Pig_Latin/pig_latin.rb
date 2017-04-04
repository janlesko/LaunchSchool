class PigLatin
  def self.translate(word)
    words = word.split
    words.map { |word| translator(word) }.join(" ")
  end
  
  def self.translator(word)
    cons = %w(ch qu squ thr th sch) + ('a'..'z').to_a - %w(a e i o u)
    cons.each do |con|
      break if word =~ /^(yt|xr)/
      return word[con.size..-1] + con + 'ay' if word[0, con.size] == con
    end
    word + "ay"
  end
end
