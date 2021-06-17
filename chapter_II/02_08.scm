(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

; [a,b]−[c,d]=[a−d,b−c]
(define (subtract x y)
	(make-interval 
		(- (lower-bound x) (upper-bound y))
		(- (upper-bound x) (lower-bound y))
	)
)