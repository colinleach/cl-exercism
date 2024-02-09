largest_series_product <- function(digits, span){
  stopifnot(span > 0 && nchar(digits) >= span && grepl("^\\d+$", digits))
  
  digit_vec <- digits |>
    strsplit("") |>
    unlist() |>
    as.numeric()
  
  seq_len(length(digit_vec) - span + 1) |>
    sapply(function(i) prod(digit_vec[i:(i + span - 1)])) |>
    max()
}
