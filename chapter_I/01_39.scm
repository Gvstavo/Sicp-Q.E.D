(define (cont-frac n d  k)

		(define (continued i)

			(if (= i  k) 
				(/ (n i) (d i ))
				(/ (n i) (+ (d i) (continued ( + i 1))))
			)
		)

		(continued 1)
)

(define (tan-cf x k)
	(define (n i) (if (= i 1)x (* x x -1.0)))
	(define (d i) (- (* 2 i) 1 ))

	(cont-frac n d k)
)

(display (tan-cf 1 10))