#lang racket

(provide make-robot
         name
         reset!
         reset-name-cache!)

(define used (mutable-set))

(define (random-digit)
  (integer->char 
    (+ (char->integer #\0) (random 10))))

(define (random-letter)
  (integer->char 
    (+ (char->integer #\A) (random 26))))

(define (new-name)
  (let ([name (list->string 
    `(,(random-letter) ,(random-letter) 
      ,(random-digit) ,(random-digit) ,(random-digit)))])
    (if (set-member? used name)
      (new-name)
      name)))

(define (make-robot)
  (let ([name (new-name)])
    (set-add! used name)
    name))

(define (name robot)
  robot)

(define (reset! robot)
(let ([name (new-name)])
  (set-remove! used robot)
  (set-add! used name)))

(define (reset-name-cache!)
  (set-clear! used))
