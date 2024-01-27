library(stringr)

to_rna <- function(dna) {
  bases <- c("A", "C", "G", "T")
  transcripts <- c("U", "G", "C", "A")
  
  complement <- function(base) transcripts[bases == base]
   
  input_bases <- str_split(dna, "")[[1]]
  stopifnot (all(input_bases %in% bases))
  
  lapply(input_bases, complement) |>
    paste0(collapse = "")
}
