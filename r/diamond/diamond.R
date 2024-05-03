diamond <- function(letter) {
  if (letter == "A") return("A")
  
  letter_index <- match(letter, LETTERS)
  rows <- past0(c(rep("", letter_index), "A", rep("", letter_index)))
  
}
