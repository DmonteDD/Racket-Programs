#lang plait

(define (comma-join formatter str-lst)
  (cond
    [(empty? str-lst)
     ""]
    [(empty? (rest str-lst))
     (string-append (formatter (first str-lst))
                    "")]
    [else
     (string-append (formatter (first str-lst))
                    (string-append ","
                                   (comma-join formatter (rest str-lst))))]))

(test(comma-join to-string (list 1 2 3)) "1,2,3")
(test(comma-join to-string (list 1 2 3 4 5 6 7 8 9 10 )) "1,2,3,4,5,6,7,8,9,10")
(test(comma-join to-string (list )) "")
(test(comma-join to-string (list '345)) "345")
(test(comma-join to-string (list 1)) "1")
(test(comma-join to-string (list "a" "b" "c")) "\"a\",\"b\",\"c\"")
(test(comma-join to-string (list #f #t)) "#f,#t")
(test(comma-join to-string (list "," "," "," )) "\",\",\",\",\",\"")
(test (comma-join symbol->string '(a b c d e)) "a,b,c,d,e")
(test (comma-join identity '("a" "b" "c" "d" "e")) "a,b,c,d,e")
(test (comma-join (lambda (p) (to-string (fst p))) (list (values 1 2) (values 3 4))) "1,3")

