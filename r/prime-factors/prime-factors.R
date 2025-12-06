prime_factors <- function(number) {
  result <- c()
  remaining <- number
  
  i <- 2
  while (i <= number && remaining > 1) {
    while (remaining %% i == 0) {
      result <- c(result, i)
      remaining <- remaining / i
      if (remaining == 1) break
    }
    i <- i + 1
  }
  result
}
