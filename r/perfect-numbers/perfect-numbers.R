number_type <- function(n){
<<<<<<< Updated upstream
  stopifnot(n > 0)
  numrange <- 1:(n %/% 2)
  aliquot <- sum(numrange[n %% numrange == 0])
  
  if (n == 1 || aliquot < n) return("deficient")
  if (aliquot == n) return("perfect")
  if (aliquot > n) return("abundant")
=======
  
>>>>>>> Stashed changes
}
