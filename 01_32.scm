(define (accumulate combiner null-value term a next b)
	(if (> a b  )
		null-value
		(accumulate 
			combiner
			(combiner null-value a)
			term 
			(next a) 
			next
			b
		)	
	)
)