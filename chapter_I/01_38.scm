(define (n) (lambda (i) 1.0 ))
(define (d)(lambda (i)  
	(cond 
		((= i 2) 2)
		((=(remainder (- i 2) 3) 0 )   (* ( + (quotient i 3) 1 ) 2))
		(else 1)
)))

(define (cont-frac n d  k)

		(define (continued i)

			(if (= i  k) 
				(/ (n i) (d i ))
				(/ (n i) (+ (d i) (continued ( + i 1))))
			)
		)

		(continued 1)
)

(display (cont-frac (n) (d) 10))
