hamming <- function(strand1, strand2) {
  if (length(strand1) != length(strand2)) {
    stop("Mismatched lengths")
  }
  
  seq1 = array(unlist(strsplit(strand1, split='')))
  seq2 = array(unlist(strsplit(strand2, split='')))
  mismatches = seq1 != seq2
  length(mismatches[mismatches])
}
