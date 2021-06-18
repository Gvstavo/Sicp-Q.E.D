(define (my-last-pair l)
	(if (null? (cdr l))
		(car l)
	(my-last-pair (cdr l))
	)

)

(display (my-last-pair (list 23 72 149 34 )))