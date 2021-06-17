(define (pow a n)
	(if (= n 1)
		a
	(* a (pow a (- n 1)))
	)
)


(define (my-cons a b)
	(* (pow 2 a) (pow 3 b))
)


(define (count-division a b n )

	(if (= (remainder a b) 0)
		(count-division (/ a b) b (+ n 1))
	n)

)


(define (my-car z)

	(count-division z 2 0)

)

(define (my-cdr z)

	(count-division z 3 0)
)

(display (my-car (my-cons 1 2)))
(newline)
(display (my-cdr (my-cons 1 2)))