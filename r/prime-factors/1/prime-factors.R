prime_factors <- function(number) {
  if (number == 1) return(c())
  if (number == 2) return (c(2))
  if (is_prime(number)) return(c(number))
  
  result <- integer()
  remaining <- number
  
  while (remaining %% 2 == 0) {
    result <- c(result, 2)
    remaining <- remaining / 2
  }

  i <- 3
  top <- remaining %/% 2 + 3
  while (i < top && remaining > 1) {
    while (remaining %% i == 0) {
      result <- c(result, i)
      remaining <- remaining / i
      if (remaining == 1) break
    }
    i <- i + 2
  }
  sort(result)
}

is_prime <- function(n) {
  if (n %% 2 == 0) return(FALSE)
  
  i <- 3
  while (i < n %/% 2 + 1) {
    if (n %% i == 0) return(FALSE)
    i <- i + 2
  }
  TRUE
} 
