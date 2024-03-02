class Nucleotide
  def initialize(bases_in)
    @bases_in = bases_in
  end

  def self.from_dna(input)
    bases_in = input.chars
    allowed = %w[A C G T]
    bases_in.all? {|b| allowed.include? b} or raise ArgumentError
    new(bases_in)
  end

  def count(base)
    @bases_in.count(base)
  end

  def histogram
    {
      'A' => @bases_in.count('A'),
      'C' => @bases_in.count('C'),
      'G' => @bases_in.count('G'),
      'T' => @bases_in.count('T')
    }
  end
end
