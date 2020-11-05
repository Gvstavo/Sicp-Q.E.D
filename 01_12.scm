(define (factorial n) 
	(if (= n 1 )  n 
		(* n (factorial (- n 1))))
)


(define (t n k )

	(cond 

		(( = n k) 1 )
		((= k 0) 1)
		((= n 0) 1)
		(else (+ (t (- n 1) (- k 1))  (t (- n 1) k )))
	

	)


)




