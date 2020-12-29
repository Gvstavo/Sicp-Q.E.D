(define (square x) (* x x))


(define (checked_square x n)

	(cond
		( (and (> x 1) (< x (- n 1)) (= (remainder (square x) n ) 1)  )  0 )
		(else (square x))
	)

)

(define (checked_expmod base exp m)

	(cond
		((= exp 0) 1)


		((even? exp)
			(remainder (checked_square (checked_expmod base (/ exp 2) m) m) m))

		(else (remainder (* base (checked_expmod base (- exp 1) m)) m))			
	)

)

(define (expmod base exp m)
	(cond 
		((= exp 0) 1)
		((even? exp)
			(remainder (square (expmod base (/ exp 2) m)) m))
		(else (remainder (* base (expmod base (- exp 1) m)) m))))


(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times) ; by miller
	(cond 
		((= times 0)  #t)
		((miller-test n) (fast-prime? n (- times 1)))
		(else #f)))

(define (miller-test n)

	(define (try-it a)
		(= (checked_expmod a n n) a))
	(try-it (+ 1 (random (- n 1))))

)


(newline)
(display (fast-prime?  561 10))
(newline)
(display (fast-prime?  1005 10))


(newline)
(display (fast-prime?  1729 10))


(newline)
(display (fast-prime?  2465 10))

(newline)
(display (fast-prime?  2821 10))

(newline)
(display (fast-prime?  6601 10))

