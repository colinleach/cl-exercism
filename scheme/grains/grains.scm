(import (rnrs))

(define (square n)
  (if (or (< n 1) (> n 64)) 
      (error "Square out of range"))
  (expt 2 (- n 1)))

(define total
  (- (expt 2 64) 1))

