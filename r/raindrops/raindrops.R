is_factor <- function(number, factor) {
  number %% factor == 0
}

raindrops <- function(number) {
  factors = c(3, 5, 7)
  are_factors = is_factor(number, factors)
  if (any(are_factors)) {
    resp = c("Pling", "Plang", "Plong")
    paste0(resp[are_factors], collapse = '')
  } else {
    as.character(number)
  }
}
