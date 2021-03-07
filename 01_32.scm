(define (inc x) (+ x 1))

(define (identity x) x)

(define (fn a b) (+ a b))

(define (product a b) (* a b))
(define (accumulate combiner null-value term a next b)
	(if (> a b  )
		null-value
		(accumulate 
			combiner
			(combiner null-value a)
			term 
			(next a) 
			next
			b
		)	
	)
)

(define (sum n)

	(accumulate fn 0 identity 1 inc n)

)

(define (factorial n )

	(accumulate product 1 identity 1 inc n)

)



(define (accumulate-iter  combiner null-value term a next b)
	(define (iter a result)

		(if (> a  b)
			result
			(iter (next a) (combiner result a))
		)
	)
	(iter a null-value)
)


(define (factorial-iter n)
(accumulate-iter product 1 identity 1 inc n)

)

(display (factorial-iter 8))