(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))


(define (percent i) (* 100.0 (/ (width i) (center i))))
(define (center i) (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c w)
	(make-interval
		(- c (* c ( / w 100)))
		(+ c (* c ( / w 100)))
	)

)

(define eg (make-center-percent 10 10))

(display (upper-bound eg))
(newline)
(display (lower-bound eg))
(newline)
(display (percent eg))
(newline)