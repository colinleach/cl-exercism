library(tidyverse)

normalized_plaintext <- function(input) {
  input |> str_to_lower() |> str_remove_all("[^a-z0-9]")
}

matrix_form <- function(normalized) {
  r <- normalized |> nchar() |> sqrt() |> ceiling()
  c <- (nchar(normalized) / r) |> ceiling()
  normalized |> 
    str_pad(c * r, "right") |> 
    str_split_1("") |>
    matrix(nrow=r, ncol=c)
}

ciphertext <- function(input) {
  normalized <- normalized_plaintext(input)
  if (normalized == "") return("")
  
  normalized |>
    matrix_form() |> 
    apply(1, str_flatten) |>
    str_flatten(collapse = " ")
}

# The remaining two functions seem gratuitous on this track
# Kind of ugly, and I would be happy to remove these tests
# (I'm the current R maintainer)

plaintext_segments <- function(input) {
  normalized <- normalized_plaintext(input)
  if (normalized == "") return("")
  
  normalized |>
    matrix_form() |> 
    apply(2, str_flatten) |>
    map_chr(str_trim)
}

encoded <- function(input) {
  normalized <- normalized_plaintext(input)
  if (normalized == "") return("")
  
  normalized |>
    matrix_form() |> 
    apply(1, str_flatten) |>
    str_flatten() |>
    str_replace_all(" ", "")
}
