(define (sum term a next b)
	(define (iter a result)
		(if (> a b)
			result 
			(iter (next a) (+ result a))
		)
	)
(iter a 0))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum-integers a b)
	(sum identity a inc b)
)

(display (sum-integers 1 100))