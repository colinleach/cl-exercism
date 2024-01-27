library(stringr)

acronym <- function(input) {
  input |> 
    str_replace_all("-", " ") |>
    str_replace_all("\\s+", " ") |>
    str_remove_all("[:punct:]") |>
    str_split(" ") |>
    unlist() |>
    str_sub(1, 1) |>
    str_to_upper() |>
    str_flatten()
}
