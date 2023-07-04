(import (rnrs))

(define (factor? x y)
  (= (modulo x y) 0)) 

(define (leap-year? year)
  (or (factor? year 400)
    (and (factor? year 4) (not (factor? year 100)))))

