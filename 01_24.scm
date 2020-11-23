(define (square x) (* x x))

(define (smallest-divisor n)

	(find-divisor n 2)
)

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
			(remainder (square (expmod base (/ exp 2)m)) m) 
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

	(= n (smallest-divisor n ))
)


 (define (runtime)
   (define now (gettimeofday))
   (+ (car now) (/ (cdr now) 1000000.)))

(define (timed-prime-test n)

	(newline)
	(display n)
	(start-prime-test n (runtime))
)

(define (start-prime-test n start-time)

	(if  (fast-primes? n 3)
		(report-prime (- (runtime) start-time))
	)
)

(define (report-prime elapsed-time)

	(display " *** ")
	(display elapsed-time)
)


(define (search-for-primes r1 r2) 

	(cond 
		((or (= r1 r2) (> r1 r2)) (timed-prime-test r1))
		((divides? 2 r1)  (timed-prime-test (+ r1 1))  (search-for-primes (+ r1 1) r2))
		(else (timed-prime-test (+ r1 2))  (search-for-primes (+ r1 2) r2))
	)
)

