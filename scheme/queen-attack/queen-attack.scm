(import (rnrs))

(define (attacking? white black)
  (define r1 (car white))
  (define c1 (cadr white))
  (define r2 (car black))
  (define c2 (cadr black))
  (or 
    (eq? r1 r2)
    (eq? c1 c2)
    (eq? (abs (- r1 r2)) (abs (- c1 c2)))))
