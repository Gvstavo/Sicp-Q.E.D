(define (average a b)
	(/ (+ a b) 2)
)

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
