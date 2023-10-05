(import (rnrs))

(define (square-of-sum n)
  (expt (/ (* n (+ 1 n)) 2) 2))

(define (sum-of-squares n)
  (/ (* n (+ 1 n) (+ 1 (* n 2))) 6))

(define (difference-of-squares n)
  (- (square-of-sum n) (sum-of-squares n)))



