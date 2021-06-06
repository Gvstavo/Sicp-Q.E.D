(define (square x) (* x x))

(define (smallest-divisor n)

	(find-divisor n 2)
)

(define (next divisor)

	 (cond 

	 		((divides? 2 divisor) (+ divisor 1))
	 		(else (+ 2 divisor))

	 )


)

(define (find-divisor n test-divisor)

	(cond 
		( (> (square test-divisor) n ) n )
		((divides? test-divisor n) test-divisor)
		(else  (find-divisor n (next divisor)))

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