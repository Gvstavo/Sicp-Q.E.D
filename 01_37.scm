(define (cont-frac n d  k)

		(define (continued i)

			(if (= i  k) 
				(/ (n i) (d i ))
				(/ (n i) (+ (d i) (continued ( + i 1))))
			)
		)

		(continued 1)
)

(define (cont-frac-iter n d k)

	(define (iter i result)
		(if (= i k)
			result
			(iter (+ i 1) ( / (n i )  (+ result (d i))))
		)
	)
	(iter 0 (/ (n k) (d k )))
)

(display "recursive:")
(display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 12))
(newline)

(display "iterative:")
(display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 12))
(newline)