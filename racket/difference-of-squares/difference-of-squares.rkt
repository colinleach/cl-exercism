#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares n)
  (/ (* n (add1 n) (add1 (* n 2))) 6))

(define (square-of-sum n)
  (expt (/ (* n (add1 n)) 2) 2))

(define (difference n)
  (- (square-of-sum n) (sum-of-squares n)))
