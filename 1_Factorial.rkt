#lang plait

;;Program to find Factorial using Tail Recursion

(define (fact n)
  (cond
    [(zero? n) 1]
    [else (* n (fact (- n 1)))]))

;;Test case with direct call
(fact 10)
(fact 5)
(fact 6)

;;Test using test
(test(fact 10) 3628800)

#|
Test Cases Module+ - use #lang racket instead of plait

(module+ test
  (require rackunit)
  (check-equal? (fact 10) 3628800)
  (check-equal? (fact 5) 120))
|#
