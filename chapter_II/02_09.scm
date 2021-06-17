(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))


(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))


(define (add-interval x y)
	(make-interval 
		(+ (lower-bound x) (lower-bound y)) 
		(+ (upper-bound x) (upper-bound y))
	)
)

(define (mul-interval x y)
	(let(
		(p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))
)


(define eg1 (make-interval 1 10))
(define eg2 (make-interval 5 15))

(display (width (add-interval eg1 eg2)))
(newline)
(display ( + (width eg1) (width eg2)))
(newline)
(display (width (mul-interval eg1 eg2)))
(newline)
(display (* (width eg1) (width eg2))) 