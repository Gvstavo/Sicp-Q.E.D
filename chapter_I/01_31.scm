; a product define

(define (product term a next b )
	(if (> a b)
		1
	(* (term a) (product term (next a) next b)))
)

(define (inc x) (+ x 1))

(define (identity x) x)


(define (factorial n)
	(product identity 1 inc n)
)

;b iterative product

(define (product-iter term a next b)
	(define (iter a result)

		(if (> a  b)
			result
			(iter (next a) (* result a ))
		)
	)
	(iter a 1)
)


(define (factorial-iter n)
	(product-iter identity 1 inc n)
)



;c




