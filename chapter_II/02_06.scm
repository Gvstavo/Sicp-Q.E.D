;(define (inc n)(+ 1 n))

(define zero 
	(lambda (f) 
		(lambda (x) x)
	)
)

(define (add-1 n)
	(lambda (f) 
		(lambda (x) 
			(f ((n f) x))
		)
	)
)

(define one
	(lambda (f)
		(lambda (x) (f x))
	)
)

(define two
	(lambda (f)
		(lambda (x) (f (f x)))
	)
)

(define (add a b)

	(lambda (f) 
		(lambda (x) 
			(f ( (a (b f)) x ))
		)
	)

)
(define three (add one two))


;(display ((three inc) 0) )

