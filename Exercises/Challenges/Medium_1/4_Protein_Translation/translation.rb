class InvalidCodonError < StandardError; end

module Translation
  PROTEINS = { 'Methionine' => ['AUG'], 'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
               'Leucine' => ['UUA', 'UUG'], 'Phenylalanine' => ['UUU', 'UUC'],
               'Tyrosine' => ['UAU', 'UAC'], 'Cysteine' => ['UGU', 'UGC'],
               'Tryptophan' => ['UGG'], 'STOP' => ['UAA', 'UAG', 'UGA'] }

  def self.of_codon(codon)
    PROTEINS.each { |protein, codons| return protein if codons.include?(codon) }
    raise InvalidCodonError
  end

  def self.of_rna(strand)
    strand.scan(/.../).each_with_object([]) do |codon, proteins|
      return proteins if of_codon(codon) == 'STOP'
      proteins << of_codon(codon)
    end
  end
end