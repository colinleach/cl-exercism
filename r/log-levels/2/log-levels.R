# Second solution makes me understand why stringr is so popular!

library(stringr)

split_msg <- function(msg) {
  str_split_1(msg, ": ")
}

message <- function(msg) {
  split_msg(msg)[2] |> str_trim()
}

log_level <- function(msg) {
  split_msg(msg)[1] |>
    str_to_lower() |>
    str_sub(2, -2)
}

reformat <- function(msg) {
  str_glue("{message(msg)} ({log_level(msg)})")
}
