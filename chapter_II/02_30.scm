(define (square x) (* x x))

(define a (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree tree)

	(cond 
		((null? tree)tree)
		((not (pair? tree)) (square tree))
		(else 
			(cons (square-tree (car tree)) (square-tree (cdr tree)))
		)
	)
)


(define (square-tree-map tree)

	(map 
		(lambda (x)
			(if (pair? x)
				(square-tree-map x)
				(square x)
			)
		)
		tree
	)

)



(display a)
(newline)

(display (square-tree a))
(newline)

(display (square-tree-map a))
(newline)