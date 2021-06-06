(define (compose f g)(lambda (x) (f (g x)) ))

(define (average a b)
	(/ (+ a b) 2)
)

(define (average-damp f)
	(lambda (x) (average x (f x)))
)

(define tolerance 0.00001)


(define (close-enought? v1 v2)
	(< (abs (- v1 v2)) tolerance))



(define (repeated f n)
	(if (= n 1)
		f
	 (repeated (compose f f) (- n 1))
	)
)





;(define (fixed-point f first-guess)

;	(define (close-enought? v1 v2)
;		(< (abs (- v1 v2)) tolerance))

;	(define (try guess)
;		(let ((next (f guess)))

;			(if (close-enought? guess next)
;				next
;			(try next))))
	
;		(try first-guess)
;)



(define (iterative-improve good-enough? improve)

	(define (improve n)
		(if (good-enough? x (improve x)) 
			improve
		(iterative-improve good-enough? (repeated improve (+ n 1)))
	))

	(improve 1)
)

(define (fixed-point f first-guess)
	((iterative-improve good-enough? f) first-guess)
)

;(define (sqrt x)
;	((iterative-improve close-enought? (lambda (y) (/ x y))) x)
;)

;(display (sqrt 625))
