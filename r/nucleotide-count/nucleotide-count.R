nucleotide_count <- function(input) {
    chars <- strsplit(input, "")[[1]]
    stopifnot(all(chars %in% c("A", "C", "G", "T")))
    list(
      A = length(chars[chars == "A"]),
      C = length(chars[chars == "C"]),
      G = length(chars[chars == "G"]),
      T = length(chars[chars == "T"])
    )
}
