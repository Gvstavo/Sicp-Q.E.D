
(define (square x) (* x x))

(define (product term a next b )
	(if (> a b)
		1
	(* (term a) (product term (next a) next b)))
)

(define (inc x) (+ x 1))

(define (identity x) 
	(* 
		(/ (* 2 x) (- (* 2 x) 1))

		(/ (* 2 x)  (+ 1 (* 2 x)))
	)
)


(define (wallis-product n)

	(product identity 1 inc n)

)


;(display (wallis-product 3))