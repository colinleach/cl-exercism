sum_of_multiples <- function(factors, limit) {
  pos_factors = factors[factors > 0]
  1:(limit-1) |>
    sapply(\(i) ifelse(any(i %% pos_factors == 0), i, 0)) |>
    sum()
}
