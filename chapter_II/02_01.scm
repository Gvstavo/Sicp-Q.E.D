(define (gcd a b)
	(if (= b 0)
	a
	(gcd b (remainder a b)))
)

(define (make-rat n d)
	(let ((g (gcd (abs n) (abs d))))
		(cond 
			((and (< n 0) (< d 0)) (cons (/ n g) (/ d g)))
			((or (< n 0) (< d 0)) (cons (/ -n g) (/ d g)))
			(else (cons (/ n g) (/ d g)))
		)
	)
)


	