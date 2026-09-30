(import (rnrs))

(define (step n stepcount)
  (if (= n 1) stepcount (
    step  (if (even? n)
            (quotient n 2)
            (+ (* n 3) 1))
          (+ stepcount 1) 
  )))

(define (collatz n)
  (step n 0))
