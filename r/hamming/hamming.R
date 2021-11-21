# This is a stub function to take two strings
# and calculate the hamming distance
hamming <- function(strand1, strand2) {
  stopifnot(nchar(strand1) == nchar(strand2))
  
  count <- 0
  s1 <- strsplit(strand1, "")
  s2 <- strsplit(strand2, "")
  for (i in 1:length(s1)) 
    if (s1[i] != s2[i]) 
      count <- count + 1
  
  return(count)
}
