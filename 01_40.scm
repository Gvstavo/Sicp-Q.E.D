(define (average a b)
	(/ (+ a b) 2)
)

(define dx 0.00001)
(define tolerance 0.00001)

(define (average-damp f)
	(lambda (x) (average x (f x)))
)

(define (fixed-point f first-guess)

	(define (close-enought? v1 v2)
		(< (abs (- v1 v2)) tolerance))

	(define (try guess)
		(let ((next (f guess)))

			(if (close-enought? guess next)
				next
			(try next))))
	
		(try first-guess)
)

(define (deriv g)
	(lambda (x)
		(/ (- (g (+ x dx)) (g x))dx)
	)
)

(define (fixed-point-of-transform g transform guess)
	(fixed-point (transform g) guess)
)

(define (newton-transform g)
	(lambda (x)
		(- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
		(fixed-point (newton-transform g) guess))

(define (cube x)(* x x x))
(define (square x)(* x x ))

(define (sqrt x)
(fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0))

(define (cubic a b c)
	(lambda (x)
		(+  (cube x)  ( * (square x) a) (* b x) c )
	)
)

