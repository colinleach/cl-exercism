class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError.new("strands must be equal length") if strand1.size != strand2.size
    pairs = strand1.chars.zip(strand2.chars)
    pairs.select { |p| p[0] != p[1] }.size
  end
end