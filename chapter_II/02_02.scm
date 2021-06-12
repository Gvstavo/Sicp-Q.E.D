(define (make-point x y)
	(cons x y)
)
(define (x-point x) (car x))
(define (y-point y) (cdr y))


(define (make-segment p1 p2)
	(cons p1 p2)
)
(define (start-segment x) (car x))
(define (end-segment y) (cdr y))

(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")")
	(newline)
)


(define (midpoint-segment line)
	
	(make-point 
		( / (+ (x-point (start-segment line)) (x-point (end-segment line))) 2 )  
		( / (+ (y-point (start-segment line)) (y-point (end-segment line))) 2 )
	)  

)

(print-point (midpoint-segment (make-segment (make-point 4 8) (make-point 2 12))))


;(display (midpoint-segment (make-segment (make-point 1 2) (make-point 3 5) )))
