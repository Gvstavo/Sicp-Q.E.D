(define (make-mobile left right)
	(list left right)
)


(define (make-branch len structure)
	(list len structure)
)

(define (right-branch mobile)
	(car mobile)
)

(define (left-branch mobile)
	(car (cdr mobile))
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


)

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))	
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))



(display (total-weight a))
(newline)
(display (total-weight b))
(newline)
(display (total-weight c))
(newline)

