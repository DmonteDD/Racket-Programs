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

(define-type JPair
  [jpair (key : String) (val : JSON)])

(define-type JSON
  [jstring (key : String)]
  [jarray (key : (Listof JSON))]
  [jboolean (key : Boolean)]
  [jdict (key : (Listof JPair))]
  [jnumber (key : Number)]
)

(define (json->string jitems)  
(type-case JSON jitems
  [(jboolean key)
   (if key "true" "false")]
  [(jnumber key)
   (to-string key)]
  [(jstring key)
   (to-string key)]
  [(jarray key)
   (foldr string-append "" ( list "[" (comma-join json->string key) "]"))]
  [(jdict key)
   (foldr string-append "" ( list "{" (comma-join jpair->string key) "}"))]))

 
(define (jpair->string [items : JPair])
  (string-append (to-string (jpair-key items))
                 (string-append  ":"
                                 (json->string (jpair-val items)))))

 
(test (jpair->string (jpair "Alice" (jstring "Cryptologist")))
      "\"Alice\":\"Cryptologist\"")
(test (jpair->string (jpair "Cryptologist" (jboolean #t))) "\"Cryptologist\":true")
(test (jpair->string (jpair "Midterms" (jnumber 1))) "\"Midterms\":1")
(test (json->string (jarray (list (jnumber 5) (jnumber 10))))  "[5,10]")
(test (json->string
       (jdict (list (jpair "happy"
                           (jboolean #t))
                    (jpair "crazy"
                           (jboolean #f)))))
      "{\"happy\":true,\"crazy\":false}")
