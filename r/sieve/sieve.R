sieve <- function(limit) {
  if (limit < 2) return(c())
  
  numbers <- 2:limit
  
  # status is 1 for prime, -1 for non-prime, 0 for untested
  status <- rep(0, times = limit - 1)

  repeat {
    possibles <- numbers[status == 0]
    
    # exit loop when no numbers left to test
    if (length(possibles) == 0) break
    
    next_prime <- possibles[1]
    status[numbers %% next_prime == 0] <- -1
    status[next_prime - 1] <- 1
  }
  numbers[status == 1]
}
