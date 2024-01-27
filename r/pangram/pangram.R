library(tidyverse)

is_pangram <- function(input) {
  alpha <- input |>
    str_to_lower() |>
    str_split("") |>
    unlist()

  all(letters %in% alpha)
}
