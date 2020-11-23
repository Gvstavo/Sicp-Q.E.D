(define (square x) (* x x))

(define (fermat-test n )

	(define (try-it a)
		(= (expmod a n n) a)
	)


	(try-it (+ 1 (random (- n 1))))

)

;(define (expmod base exp m)

;	(cond 

;		((= exp 0) 1 ) 

;		((even? exp)
;			(remainder (square (expmod base (/ exp 2)m)) m) 
;		)

;		(else 
;			(remainder (* base (expmod base (- exp 1) m)) m )
;		)
;	)
;)

(define (fast-expt b n)

	(cond 

		((= n 0) 1)
		((even? n)  (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))

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
