module ProteinTranslation
  CODONS = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  def self.proteins(strand : String) : Array(String)
    protein = [] of String
    seq_pointer = 0
    while seq_pointer < strand.size
      triplet = strand[seq_pointer..seq_pointer + 2]
      raise ArgumentError.new unless CODONS.has_key? triplet
      codon_translation = CODONS[triplet]
      codon_translation == "STOP" && break
      protein = protein.push(codon_translation)
      seq_pointer += 3
    end
    protein
  end
end
