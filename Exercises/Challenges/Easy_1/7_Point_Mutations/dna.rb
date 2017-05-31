# class DNA
#   def initialize(strand1)
#     @strand1 = strand1
#   end
  
#   def hamming_distance(strand2)
#     distance = 0
#     #shorter = @strand1.size < strand2.size ? @strand1.size : strand2.size
#     effective_length = [@strand1.size, strand2.size].min
#     effective_length.times do |index|
#       distance += 1 if @strand1[index] != strand2[index]
#     end
#     distance
#   end
# end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_2)
    strand_1 = @strand[0, strand_2.length]

    strand_1.chars.zip(strand_2.chars).count do |pair|
      pair.first != pair.last
    end
  end
end

DNA.new('ACT').hamming_distance('GGA')