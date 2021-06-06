
(define (f_rec n)

	(cond 

		((< n 3) n)
		(else (+  (f_rec (- n 1)) (* 2 (f_rec (- n 2))) (* 3 (f_rec (- n 3))) )) 

	

	)
)	


(define (f-iter a b c n)
	(if (= n 0) c

		(f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1) )
	)
)

(define (f_iter n)

	(cond

		((= n 0) 0)
		((= n 1) 1)
		((= n 2) 2)
		(else (f-iter 0 1 2 (- n 2)))

	)	

	
)


(display (f_rec 4))
