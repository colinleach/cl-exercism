collatz_step_counter <- function(num) {
  stopifnot(all(num > 0))
  num |>
    lapply(count_steps) |>
    unlist()
}

count_steps <- function(n){
  count <- 0
  while (n != 1) {
    n <- ifelse(n %% 2 == 0, n / 2, 3 * n + 1)
    count <- count + 1
  }
  count
}
