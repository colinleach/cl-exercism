library(tidyverse)

generate_key <- function () {
  c(letters) |> sample(100, replace = TRUE) |> str_flatten()
}

encode <- function(plaintext, key, enc = TRUE) {
  plaintext |> 
    str_split_1("") |>
    imap_chr(\(c, i) change(c, i, key, enc)) |>
    str_flatten()
}

decode <- function(ciphertext, key) {
  encode(ciphertext, key, FALSE)
}

change <- function(chr, inx, key, enc) {
  keys <- str_split_1(key, "")
  while (inx > length(keys)) inx = inx - length(keys)
  offset <- utf8ToInt(keys[inx]) - utf8ToInt('a')
  if (!enc) {
    offset = -offset
  }
  raw_int <- utf8ToInt(chr) + offset
  if (raw_int > utf8ToInt('z')) {
    raw_int <- raw_int - 26
  } else if (raw_int < utf8ToInt('a')) {
    raw_int <- raw_int + 26
  }
  intToUtf8(raw_int)
}
