#lang racket
(list 1 2 3)
(list "a" "b" "c" "d" "e")
(list 'a 'b 'c)
(list 1 2 (list "a" "b" "c" (list 'a 'b 'c)))

'(1 2 3)
'(a b c)

(list + 1 2)
(list * 5 2)
(quote (* 5 2)) ;;list with quote called datum

(list)
'()
(list '())
null

(equal? (list) (list '()))
(equal? (list) '())

(define lone 1)
lone
(define items [list '21 '31 '41])
items
(define itemsl '(21 31 41))
itemsl
(define combo '((1 2 3)(4 5 6)))
combo

(list + - * / )
'(3 2 lone)
`(3 2 ,lone)
'(3 2 ,lone)
`(3 2 ,items)
`(3 2 ,@items)
'(3 2 ,items)
'(3 2 ,@items)

;;List Functions
(list? '())
(list? (list))
(list? null)
(list? '(1 2 3))
(list? 123)
(list? '123)

(empty? '())
(empty? (list))
(empty? 123)

(length '())
(length '(1 2 3 4))
(length '(1 2 3 '(4 5 6 7 '(8 9 10))))

(flatten '(1 2 3 '(4 5 6 7 '(8 9 10))))
(flatten '(1 2 3 (4 5 6 7 (8 9 10))))

(+ 1 2 3) 
(apply + '(1 2 3))
(apply * 1 2 '(4 5))

(map abs (list -1 -2 3 -4 -5))
(map * '(1 2 3) '(4 5 6))

(cons 1 '(1 2 3))
(cons '(1 2) '(2 3))
(cons '( 1 2 3) 4)
(cons 1 (cons 2 null))
(cons 11 items)
(cons 69 empty)
(cons 1 (list 2 3 4 5 6 7 8))
;(cons (list 1 2 3) 4) -- Not Possible
(cons 1 (cons 2 (list 3 4 5 6 7 8 9 10)))

(first items)
(car items)
(rest items)
(cdr items)
(cons (first items) (rest items))
(cons (car items) (rest items))
(rest '(1))

(range 10)
(range 0.5 10)
(range 1.5 10)
(range 6.6 10)
(range 0 10 2)
(range 0 10 5)
(range 0 10 0.5)
(range 0 10 0.7)

(pair? (cons 1 2))
(pair? '((1 2) (3 4)))
(assoc 5 '((1 2) (3 4) (5 6) (7 8) (5 10)))

(define empty-list[list ])
(cond
  [(empty? empty-list) (display "list is empty")])

(append '(1 2 3) '(1 2 3))
(append (list 4 5 6) (list '7 '8 '9))
(append '(1 2 3) '(4 5 6) '(7 8 9))

(reverse items)

(member 21 items)
(member 31 items)
(member 5 '(1 2 3 4 5 6 7 5 8 9 10))

(map add1 (list 1 3 4 6))
(map (lambda (i) (/ 2 i)) '(1 2 3))
(map / `(1 2 3))
(filter even? (list 1 2 3 4 5 6))

(foldl + 10 (list 1 2 3 4 5 6 7))
(foldl / 100 (list 200 4))
(foldr + 10 (list 1 2 3 4 5 6 7))
(foldr / 100 (list 4 200))

(for-each (lambda (i) (display i)) '(1 2 3 4 5 6))

(let ([first "Damian"] [last "Dmonte"])
    (let ([first last] [last first])(list first last)))