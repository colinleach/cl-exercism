#lang racket

(provide balanced?)

(define opening (list->set '(#\[ #\( #\{ )))
(define closing (list->set '(#\] #\) #\} )))

(define (matched-pair? prev next)
  (or (and
       (equal? prev #\[ ) (equal? next #\]))
      (and (equal? prev #\( ) (equal? next #\)))
      (and (equal? prev #\{ ) (equal? next #\}))))

(define (rec-balanced? stack rest)
  (if (empty? rest) 
    stack
    (if (set-member? opening (car rest))
      (rec-balanced? (cons (car rest) stack) (cdr rest))
      (if (set-member? closing (car rest))
        (if (empty? stack)
          (cons (car rest) stack)
          (if (matched-pair? (car stack) (car rest))
            (rec-balanced? (cdr stack) (cdr rest))
            stack))
        (rec-balanced? stack (cdr rest))))               
      )
)

(define (balanced? str)
  (empty? (rec-balanced? '() (string->list str))
          ))

