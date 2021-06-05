(define (average a b)
	(/ (+ a b) 2)
)

(define (compose f g)(lambda (x) (f (g x)) ))


(define (repeated f n)
	(if (= n 1)
		f
	 (repeated (compose f f) (- n 1))
	)
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


(define (expr x n)
	(if (= n 1)
		x 
	(* x (expr x (- n 1))))
)

(define (logarithm n k)(/ (log k) (log n)))

(define (nth x n)
	(fixed-point 
		((repeated average-damp (floor (logarithm 2 n))) (lambda (y) (/ x (expr y (- n 1)))) ) 1.0
	)
)


;(lambda (y) (/ x (expr y (- n 1))))

;(display (logarithm 5 25))
