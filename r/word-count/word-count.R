library(stringr)

word_count <- function(input) {
  input |>
    str_to_lower() |>
    str_replace_all(",", " ") |>
    str_replace_all(r"('\s|\s'|^'|'$)", " ") |>
    str_replace_all(r"([^a-z0-9\s\'])", " ") |>
    str_squish() |>
    str_split_1("\\s") |>
    table() |>
    as.list()
}
