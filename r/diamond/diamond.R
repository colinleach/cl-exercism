diamond <- function(letter) {
  if (letter == "A") return("A")
  letter_index <- match(letter, LETTERS)
  
  make_row <- function(c) {
    if (c == "A")
      paste0(strrep(" ", letter_index - 1), "A", strrep(" ", letter_index - 1))
    else {
      pos <- match(c, LETTERS)
      outer <- strrep(" ", letter_index - pos)
      inner <- strrep(" ", 2 * pos - 3)
      paste0(outer, c, inner, c, outer)
    }
  }

  top_half = lapply(LETTERS[1:letter_index], make_row)
  bottom_half = rev(top_half)
  paste(c(top_half, bottom_half[-1]), collapse="\n")
}