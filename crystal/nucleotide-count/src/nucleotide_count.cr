module NucleotideCount
  def self.nucleotide_counts(nucleotides : String) : Hash(Char, Int32)
    bases_in = nucleotides.chars
    allowed = ['A', 'C', 'G', 'T']
    unless bases_in.all? {|b| allowed.index(b) != nil}
      raise ArgumentError.new
    end
    {
    'A' => bases_in.count('A'),
    'C' => bases_in.count('C'),
    'G' => bases_in.count('G'),
    'T' => bases_in.count('T')
    }
  end
end
