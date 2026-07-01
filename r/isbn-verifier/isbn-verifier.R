library(tidyverse)

is_valid <- function(isbn) {
  no_hyphens <- str_remove_all(isbn, "-")
  if (!str_detect(no_hyphens, "^\\d{9}[X\\d]$")) return(FALSE)
  
  codes <- no_hyphens |> 
    str_split_1("") |> 
    map_int(\(c) ifelse(c == "X", 10, as.integer(c))) |> 
    imap(\(n, i) n * (11 - i)) |>
    unlist()
  sum(codes) %% 11 == 0
}
