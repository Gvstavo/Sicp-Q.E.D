
(define (expt b n )
	(fast_expt_iter b n 1)
)

(define (fast_expt_iter b n ret)

	(if (= n 1) 
		ret
		(if ( = (remainder n 2) 0) 
			(fast_expt_iter b (/ n 2) (* ret b b))
			(fast_expt_iter b (- n 1) (* ret b))
		)
	)
)


(display (expt 2 5))