(define (fringe x)

	(define (leaves l lx)

		(if (null? l)
			lx
			(if (pair? (car l))
				(leaves (cdr l) (append lx (leaves (car l) '())))
				(leaves (cdr l) (append lx (list (car l))))
			)
		)
	)
	(leaves x '())
)

(define x (list (list 1 2) (list 3 4) 5 6))
(display (fringe x))
(newline)
;(display (fringe list ( x x)))