(define (make-mobile left right)
	(list left right)
)


(define (make-branch len structure)
	(list len structure)
)

(define (right-branch mobile)
	(car (cdr mobile))
	;(car mobile)
)

(define (left-branch mobile)
	(car mobile)
	;(car (cdr mobile))
)


(define (branch-length branch)
	(car branch)
)

(define (branch-structure branch) 
	(car (cdr branch))
)


(define (total-weight mobile)

	(define (branch-weight branch n)
		(if (pair? (branch-structure branch))
			(total-weight (branch-structure branch))
			(+ n (branch-structure branch))
		)
	)

	(+ (branch-weight (right-branch mobile) 0) (branch-weight (left-branch mobile) 0))

)

(define (balanced mobile)

	(define (branch-weight branch n)
		(if (pair? (branch-structure branch))
			(total-weight (branch-structure branch))
			(+ n (branch-structure branch))
		)
	)

	(define (branch-balanced branch)
		(if (pair? (branch-structure branch))
			(balanced (branch-structure branch))
			#t
		)
	)



	(and
		(=
			(*(car (left-branch mobile)) (branch-weight (left-branch mobile) 0) )
			(*(car (right-branch mobile)) (branch-weight (right-branch mobile) 0) )
		)
		(branch-balanced (left-branch mobile))
		(branch-balanced (right-branch mobile))
	)

)

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))	
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))
(define d (make-mobile (make-branch 10 a) (make-branch 12 5)))

;(display (balanced a))
;(newline)
;(display (balanced b))
;(newline)
;(display (balanced c))
;(newline)
(display (balanced d))
(newline)
;(display (total-weight a))
;(newline)
;(display (total-weight b))
;(newline)
;(display (total-weight c))
;(newline)

