(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))


(define (percent p) (/ p 100))
(define (center i) (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c w)
	(make-interval
		(- c (* c (percent w)))
		(+ c (* c (percent w)))
	)

)