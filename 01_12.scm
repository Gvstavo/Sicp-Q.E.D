


(define (pascal_triangle n)
	(pascal_triangle_rec n 0 0)
)

(define (pascal_triangle_rec n c k )


	(cond 

		((> c k)  (display (t c k))  (pascal_triangle_rec n c (+ 1 k)) )
		((= c k)  (display (t c k))  (pascal_triangle_rec n ( + c 1) 0))
		((and (= c n) (= k n)) (display (t c k)))

	)
)	


(define (t n k )

	(cond 

		(( = n k) 1 )
		((= k 0) 1)
		((= n 0) 1)
		(else (+ (t (- n 1) (- k 1))  (t (- n 1) k )))
	
	)
)




