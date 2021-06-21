(define (my-for-each f items)
	
	(cond 
		((null? items) '())
		(else 
			(f (car items))
			(my-for-each f (cdr items))
		)
	)
)


(my-for-each (lambda (x) (newline) (display x)) (list 57 321 88))