(define (square x) (* x x))

(define (fermat-test n )

	(define (try-it a)
		(= (expmod a n n) a)
	)


	(try-it (+ 1 (random (- n 1))))

)

(define (expmod base exp m)

	(cond 

		((= exp 0) 1 ) 

		((even? exp)
			(remainder (* (expmod base (/ exp 2)m)  (expmod base (/ exp 2)m)) m) 
		)

		(else 
			(remainder (* base (expmod base (- exp 1) m)) m )
		)
	)
)



(define (expmod base exp m )

	(remainder (fast-expt base exp) m)
)

(define (fast-primes? n times)
	(cond 
		((= times 0) #t)
		((fermat-test n)  (fast-primes? n (- times 1)))
		(else #f)
	)
)

; the explicit multiplication compels the interpreter to evaluate two times the (expmod base (/ exp 2)m)  operation, instead of evaluate once and multiply the result itself.