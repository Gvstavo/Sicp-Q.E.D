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

	(if  (prime? n)
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

(search-for-primes 1000 1100)

;(search-for-primes 10000 10100)

;(search-for-primes 100000 100100)

(search-for-primes 1000000 1000100)

