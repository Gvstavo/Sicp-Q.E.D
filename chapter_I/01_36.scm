(define tolerance 0.00001)

(define (average a b)
	(/ (+ a b) 2)
)



(define (fixed-point f first-guess)

	(define (close-enought? v1 v2)
		(< (abs (- v1 v2)) tolerance))

	(define (try guess)
		(display guess)
		(newline)
		(let ((next (f guess)))

			(if (close-enought? guess next)
				next
			(try next))))
	
		(try first-guess)
)


(fixed-point (lambda (y) (/ (log 1000) (log y))) 4)

(display "with average computation")
(newline)


(fixed-point (lambda (y) (average y (/ (log 1000) (log y)))) 4)
