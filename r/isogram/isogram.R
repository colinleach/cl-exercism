library(stringr)

is_isogram <- function(word) {
  chars <- word |>
    str_replace_all(regex("\\W+"), "") |>
    str_split("") |>
    unlist() |>
    str_to_lower()
  length(chars) == length(unique(chars))
}
