class Crypto
  def initialize(string)
    @string = string
  end

  def normalize_plaintext
    @string.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    cipherarray.join
  end

  def cipherarray
    size.times.map do |index|
      plaintext_segments.map { |seg| seg[index] }
    end
  end

  def normalize_ciphertext
    cipherarray.map(&:join).join(' ')
  end
end
