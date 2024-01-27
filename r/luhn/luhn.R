library(stringr)

# Determine whether the number is valid.
is_valid <- function(input) {
  digits <- input |>
    str_remove_all(" ") 
  if (nchar(digits) < 2 || !str_detect(digits, "^[0-9]+$")) 
    return(FALSE)
  
  
  digits <- digits |>
    str_split("") |>
    unlist() |>
    rev() |>
    as.integer()
  
  digits[c(FALSE, TRUE)] <- (digits[c(FALSE, TRUE)] * 2)
  digits[digits > 9] <- digits[digits > 9] - 9
  sum(digits) %% 10 == 0
}
