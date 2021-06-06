(define (square x) (* x x))

(define (smallest-divisor n)

	(find-divisor n 2)
)

(define (find-divisor n test-divisor)

	(cond 
		( (> (square test-divisor) n ) n )
		((divides? test-divisor n) test-divisor)
		(else  (find-divisor n (+ test-divisor 1)))

	)
)


(define (divides? a b)

	(=  (remainder b a) 0)
)

(define (prime? n)

(= n (smallest-divisor n )))

(define (inc x) (+ x 1))

(define (identity x) x)

(define (sum-square a b) (+ a (square b)))

(define (filtered-accumulate combiner filter null-value term a next b)
	(cond 
		((and (< a b) (filter a) )  (filtered-accumulate combiner filter (combiner null-value a) term  (next a) next b)	) 
		((and (< a b) (not (filter a)) )  (filtered-accumulate combiner filter null-value term  (next a) next b)	) 
		(else	null-value)
	)
)

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))
	)
)

(define (relative? a b) (= (gcd a b) 1) )
(define (product a b) (* a b))
; a
(define (sum-of-primes a b)

	(filtered-accumulate sum-square prime? 0 identity a inc b)

)

(display (sum-of-primes 2 10))


;b

(define (product-relative-primes n)

	(filtered-accumulate product relative? 1 identity 1 inc n)

)
