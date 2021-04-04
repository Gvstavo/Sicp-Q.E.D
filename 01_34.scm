(define (f g)
	(g 2))

(f (lambda (z) (* z (+ z 1))))

(f f)

; 2 is a value, not a function that receives a argument to be evaluated