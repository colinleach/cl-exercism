#lang racket

(provide leap-year?)

(define (leap-year? year)
  (match (list (is-factor? 4 year) (is-factor? 100 year) (is-factor? 400 year))
    [(list #t #f _) #t]
    [(list _ _ #t)  #t]
    [_              #f]))

(define (is-factor? f year)
  (= (remainder year f) 0))