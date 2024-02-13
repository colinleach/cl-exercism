class Translation
  CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }

  def self.of_rna(strand)
    protein = []
    seq_pointer = 0
    while seq_pointer < strand.length
      codon_translation = CODONS[strand[seq_pointer..seq_pointer + 2]]
      codon_translation or raise InvalidCodonError
      codon_translation == 'STOP' and break
      protein = protein.push(codon_translation)
      seq_pointer += 3
    end
    protein
  end
end

class InvalidCodonError < Exception
end

