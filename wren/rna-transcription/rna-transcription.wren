class DNA {
  static toRNA(strand) {
    var basepair = {"A": "U", "C": "G", "G": "C", "T": "A"}
    var rna = ""
    for (c in strand) { rna = rna + basepair[c] }
    return rna
  }
}
