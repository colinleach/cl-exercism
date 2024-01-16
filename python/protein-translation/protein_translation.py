CODONS = {
    'AUG': 'Methionine',
    'UUU': 'Phenylalanine',
    'UUC': 'Phenylalanine',
    'UUA': 'Leucine',
    'UUG': 'Leucine',
    'UCU': 'Serine',
    'UCC': 'Serine',
    'UCA': 'Serine',
    'UCG': 'Serine',
    'UAU': 'Tyrosine',
    'UAC': 'Tyrosine',
    'UGU': 'Cysteine',
    'UGC': 'Cysteine',
    'UGG': 'Tryptophan',
    'UAA': 'STOP',
    'UAG': 'STOP',
    'UGA': 'STOP'
}


def proteins(strand):
    seq_pointer = 0
    protein = []
    while seq_pointer < len(strand):
        codon_translation = CODONS[strand[seq_pointer:seq_pointer + 3]]
        if codon_translation == 'STOP':
            break
        protein.append(codon_translation)
        seq_pointer += 3

    return protein
