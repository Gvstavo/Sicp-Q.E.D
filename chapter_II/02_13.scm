(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (mul-interval x y)
	(let(
		(p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))
)

(define (percent i) (* 100.0 (/ (width i) (center i))))
(define (center i) (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c w)
	(make-interval
		(- c (* c ( / w 100)))
		(+ c (* c ( / w 100)))
	)

)

(define a (make-center-percent 5 2))
(define b (make-center-percent 10 3))
(define c (mul-interval a b))
(display (percent c))