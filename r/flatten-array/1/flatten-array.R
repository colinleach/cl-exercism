library(purrr)

flatten <- function(input) {
  input |> list_flatten() |> unlist()
}
