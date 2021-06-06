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




(define (fast-primes? n times)
	(cond 
		((= times 0) #t)
		((fermat-test n)  (fast-primes? n (- times 1)))
		(else #f)
	)
)


(define (prime? n counter)

	(cond 

		((= counter 0) #t)    
		((= (expmod counter n n) counter)  (prime? n (- counter 1)) )
		(else #f)
	)

)

(define (test-fermat n) (prime? n ( - n 1)))


(display (test-fermat 561))
(newline)
(display (test-fermat 1105))
(newline)
(display (test-fermat 1729))
(newline)
(display (test-fermat 2465))
(newline)
(display (test-fermat 2821))
(newline)
(display (test-fermat 6601))
(newline)

